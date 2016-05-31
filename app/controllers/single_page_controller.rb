class SinglePageController < ApplicationController
  
  def home
    @banner_size = :tall
    @banner_image = "hoam_main.jpg"
   
    use_common_content
    
    @title = "Welcome to IEEE Pacific Visualization 2017!"

    general_group = ChairGroup.find_by_name("General Conference Chairs")
    @general_chairs = general_group.chairs unless general_group.nil?
        
    render layout: 'double_column'
  end
  
  def committee
  end
  
end
