get '/' do
  haml :index
end

get "/:resource" do
  content_type :json
  "#{params[:callback]}(#{JSON.parse(HTTParty.get(params[:resource])).to_json})"
end

__END__

@@ index
!!!
%html
  %body
    %h1
      JSONP-ifier!!!!!
    %h3
      Turns any JSON API into a JSONP API through the magic of <i>proxying</i>
    %p
      So you are trying to AJAX some JSON, right? And you run into the single origin policy? <i>And</i> the JSON API that you're hitting hasn't implemented JSONP?  Dang! Here's an example of what you might do:
      %pre
        $.getJSON("http://api.plancast.com/02/plans/show.json?attendance_id=7vl", function(data) { doStuffWith(data)});
    %p
      Fret not, young internet warrior! You can wrap that little puppy in a JSONPify URL for maximum JSONPification!
      %pre
        :preserve                                                                                          
          $.ajax({                                                                                      
            url: "http://jsonpify.heroku.com?resource=http://api.plancast.com/02/plans/show.json?=7vl",  
            dataType: 'jsonp',                                                                          
            success: function(data){                                                                    
              // manipulate data                                                                        
            }                                                                                           
          });                                                                                           
  
  
  
  
