get '/' do
  haml :index
end

get "/jsonpify" do
  response = HTTParty.get(params[:resource]) rescue "{error:'Error!'}"
  "#{params[:callback]}(#{Crack::JSON.parse(response).to_json})"
end