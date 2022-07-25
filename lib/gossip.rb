require 'csv'


class Gossip
  
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save   
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(gossip_number)
    options = {:encoding => 'UTF-8', :skip_blanks => true}
    CSV.foreach("./db/gossip.csv", options).with_index do |row, i|
      if i == gossip_number.to_i
        return row
      end
    end
  end
  
end

