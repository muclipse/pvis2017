class SinglePageController < ApplicationController
  
  def home
    @banner_size = :tall
    @banner_image = "hoam_main.jpg"
   
    use_common_content
    
    @title = "Welcome to IEEE Pacific Visualization 2017!"

    general_group = ChairGroup.find_by_name("General Conference Co-Chairs")
    @general_chairs = general_group.chairs unless general_group.nil?
    
    assert_html 'double_column'
  end
  
  def committee
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 
      
    @title = "Conference Organizers"
    @chair_groups = ChairGroup.all

    assert_html 'double_column'
  end

  def venue
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 
    
    @title="PacificVis 2017 @ Seoul National University"


    @routes_hoam = [
      {
        :from=>"Incheon International Airport",
        :to=>"Nakseongdae Station",
        :url=>"https://www.google.co.kr/maps/dir/Incheon+International+Airport,+Incheon/Nakseongdae,+Seoul/@37.5174251,126.5719698,11z/am=t/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x357b9a833a5efa59:0x8d4ba096cb5cbed4!2m2!1d126.4406957!2d37.4601908!1m5!1m1!1s0x357ca0251fc2d811:0x1bea2f567c3135ef!2m2!1d126.963418!2d37.477117?hl=en"
      },

      {
        :from=>"Nakseongdae Station",
        :to=>"Hoam Faculty House",
        :description=>"Go out to the exit number 4. Take the bus 02 in front of the gas station. Then take off the bus at the 'Hoam faculty house' after about 5 minutes."
      }

    ]

    assert_html 'double_column'
  end
  
end
