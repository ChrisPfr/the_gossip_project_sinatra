require 'gossip'


class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    #Gossip.new("super auteur", "super gossip").save
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show , locals: {comments: Comment.all(params["id"])}
    
    result = Gossip.find(params['id'])
    "#{result[0]}, #{result[1]}"
  end
  
  post '/gossips/:id/' do
    #Gossip.new("Super Auteur", "Gros potin").save
    Comment.new(params["id"], params["comment_author"], params["comment_content"]).save
    redirect '/'
  end


end
 
