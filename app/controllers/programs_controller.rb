class ProgramsController < ApplicationController
  before_filter :initial
  layout 'double_column'

  private
  def initial
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample
   
    use_common_content


    @session_rows = CSV.parse(File.read("app/data/sessions.csv"), :headers=>true).map do |csv_row|
        {
          :session=>csv_row[0],
          :id=>csv_row["id"]
        }
      end
  
  end

  def load_program(venue)
    CSV.parse(File.read("app/data/program_list_#{venue}.csv"), :headers=>true).map do |csv_row|
      {
        :id=> csv_row[0],
        :title=> csv_row["title"],
        :abstract=> csv_row["abstract"],
        :authors => [1,2,3,4,5,6,7,8,9,10].map do |i|
            given = csv_row["Given name #{i}"]
            family = csv_row["Family name #{i}"]
            email = csv_row["Email address #{i}"]
            affiliation = csv_row["Primary Affiliation #{i} - Institution"]
            if given != nil
              {:name=> "#{given} #{family}", :email=>email, :affiliation=>affiliation } 
            else
              nil
            end
          end.reject{|a| a == nil}
      }
    end
  end

  def load_contest
    CSV.parse(File.read("app/data/program_list_contests.csv"), :headers=>true).map do |csv_row|
      {
        :id=> csv_row[0],
        :title=> csv_row["title"],
        :abstract=> csv_row["abstract"],
        :authors => csv_row["authors"].split(",").map{|a| {:name=>a.strip}}
      }
    end
  end

  public
  def index

    @title = "Programs"

    @papers = load_program("papers")
    @posters = load_program("posters")
    @notes = load_program("notes")
    @contests = load_contest

    @session_dict = {}
    @session_rows.each{|s| @session_dict[s[:session]] = []}

    @session_rows.each do |s|
      if(s[:id].start_with?("paper"))
        list = @papers
      elsif s[:id].start_with?("poster")
        list = @posters
      elsif s[:id].start_with?("note")
        list = @notes
      end

      found = list.find{|p| p[:id] == s[:id] }
      if !found.nil?
        @session_dict[s[:session]] << found
      end

    end

    @keynotes = get_keynotes


    assert_html
  end

  def program
    id = params[:id]
    programs = load_program("papers").concat(load_program("posters")).concat(load_program("notes")).concat(load_contest)
    @program = programs.find{|p| p[:id] == id }

    if !@program.nil?
      @title = @program[:title]
    end

    assert_html
  end

end
