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
        :to=>"Hoam Faculy House",
        :description=>"Take the <strong>#6017 Airport limousine bus</strong> at the <strong>GATE 6B</strong> or <strong>13B</strong>. Get off at the <u>last stop</u> \"Hoam Faculty House\"",
        :url=>"http://www.airportlimousine.co.kr/eng/lbr/lbr03_3_6.php",
        :url_text=>"Airport Bus Time Table"
      },

      {
        :from=>"Nakseongdae Station",
        :to=>"Hoam Faculty House",
        :url=>"https://www.google.co.kr/maps/dir/Nakseongdae/Seoul,+Gwanak-gu,+Bongcheon-dong,+239-1+%EC%84%9C%EC%9A%B8%EB%8C%80%ED%95%99%EA%B5%90+%ED%98%B8%EC%95%94%EA%B5%90%EC%88%98%ED%9A%8C%EA%B4%80/@37.4728665,126.9584086,16z/am=t/data=!3m1!4b1!4m16!4m15!1m5!1m1!1s0x357ca0251fc2d811:0x1bea2f567c3135ef!2m2!1d126.963418!2d37.477117!1m5!1m1!1s0x357ca018af295bcd:0xb748d367f0649e98!2m2!1d126.9589084!2d37.4677522!2m2!7e2!8j1467108000?hl=en",
        :description=>"Go out to the exit number 4. Take the bus 02 in front of the gas station. Then take off the bus at the 'Hoam faculty house' after about 5 minutes."
      }

    ]

    assert_html 'double_column'
  end
  
end
