get '/' do
  if params[:resource]
    content_type :json
    httparty_error = {"error" => "HTTParty Error!"}.to_json
    return {"error" => "You must specify a callback parameter for JSONP"}.to_json unless params[:callback]
    response = HTTParty.get(params[:resource]) rescue httparty_error
    response = response.parsed_response rescue httparty_error
    return "#{params[:callback]}(#{response.to_json})"
  elsif params[:html]
    content_type 'text/html'
    return HTTParty.get(params[:html]).parsed_response
  else
    haml :index
  end
end