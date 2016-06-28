class SinglePageController < ApplicationController
  
  def home
    @banner_size = :tall
    @banner_image = "hoam_main.jpg"
   
    use_common_content
    
    @title = "Welcome to IEEE Pacific Visualization 2017!"

    general_group = ChairGroup.find_by_name("General Conference Co-Chairs")
    @general_chairs = general_group.chairs unless general_group.nil?
    
    respond_to do |format|
      format.html { render layout: 'double_column' }
      format.all {render :nothing=>true, :status=>404}
    end
  end
  
  def committee
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 
      
    @title = "Conference Organizers"
    @chair_groups = ChairGroup.all

    respond_to do |format|
      format.html { render layout: 'double_column'  }
      format.all {render :nothing=>true, :status=>404}
    end
  end
  
end
