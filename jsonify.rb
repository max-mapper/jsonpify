get '/' do
  'hay guys'
end

get "/:resource" do
  content_type :json
  response = HTTParty.get(params[:resource]) rescue "{error:'Error!'}"
  "#{params[:callback]}(#{Crack::JSON.parse(response).to_json})"
end                                                                                      
  
  
  
  
