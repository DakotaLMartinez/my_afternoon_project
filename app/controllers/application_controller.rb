class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
    
  # end
  get "/hi" do 
    { hello: "world" }.to_json
  end

  get "/paintings" do 
    paintings = Painting.all
    paintings.to_json(include: :artist)
  end

  post "/new_painting" do
    puts params.inspect
    painting_params = params.select do |key| 
      ["image", "title", "artist_name", "date", "width", "height"].include?(key)
    end
    painting = Painting.create(painting_params)
    painting.to_json
  end

end
