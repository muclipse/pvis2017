class SinglePageController < ApplicationController
  
  def home
    @banner_size = :tall
    @banner_image = "hoam_main.jpg"
   
    use_common_content
    
    @title = "Welcome to IEEE Pacific Visualization 2017!"
        
    render layout: 'double_column'
  end
  
  def committee
  end
  
end
