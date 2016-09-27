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

    @program_committee = CSV.parse(File.read("app/data/pc_list.csv"), :headers=>true).map do |csv_row|
      {:name=>"#{csv_row["first_name"]} #{csv_row["last_name"]}", :affiliation=>csv_row["affiliation"]}
    end

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
        :url=>"https://www.google.com/maps/dir/37.4771974,126.9627278/37.4681199,126.9586284/@37.4763047,126.9595362,18z/data=!4m2!4m1!3e3",
        :description=>"Go out to the exit number 4. Take the bus 02 in front of the gas station. Then take off the bus at the 'Hoam faculty house' after about 5 minutes."
      }

    ]

    assert_html 'double_column'
  end
  
end
