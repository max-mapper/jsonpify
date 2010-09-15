get '/' do
  'hay guys'
end

get "/:resource" do
  content_type :json
  "#{params[:callback]}(#{JSON.parse(HTTParty.get(params[:resource])).to_json})"
end                                                                                      
  
  
  
  
