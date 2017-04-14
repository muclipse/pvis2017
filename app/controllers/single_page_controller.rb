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
    @chair_groups = ChairGroup.all.order(:position, :id)

    @program_committee = get_committees("paper_pc_list.csv")
    @note_committee = get_committees("note_pc_list.csv")

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
        :description=>"Go out to the exit number 4. Go straight and turn left at the corner of the gas station. Take the bus 02 in front of the bakery [Jean Boulagnerie (쟝 블랑제리)]. Then take off the bus at the 'Hoam faculty house' after about 5 minutes."
      }]



    @accomodations = CSV.parse(File.read("app/data/accomodation.csv"), :headers=>true).map do |csv_row|
        {
          :name=>csv_row["name"],
          :url=>csv_row["link"],
          :type=>csv_row["type"],
          :subway=>csv_row["subway"],
          :station=>csv_row["station"],
          :thumbnail=>csv_row["thumbnail"],
          :time=>csv_row["time"]
        }
      end

    assert_html 'double_column'
  end

  def registration
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 
      
    @title = "Registration"

    yml = YAML.load_file(Rails.root.join('app/data/fee.yaml'))
    @fees = yml.keys.map{ |k| {:type=>k, :early=>yml[k]["early"], :late=>yml[k]["late"]} }
  
    assert_html 'double_column'
  end

  def workshop
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 


    id = params[:id]
    @workshop = get_workshops.map{|k,v| v}.flatten(1).find{|v| v["id"] == id}
      
    @title = @workshop["title"]

    assert_html 'double_column'
  end

  def keynote

    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample 
    use_common_content 


    id = params[:id]
    @keynote = get_keynotes.find{ |k| k[:day] == id.to_i }
      
    @title = "[Keynote] #{@keynote[:title]}"

    assert_html 'double_column'
  end
  
end
