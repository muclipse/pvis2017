class ProgramsController < ApplicationController
  before_filter :initial
  layout 'double_column'

  private
  def initial
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample
   
    use_common_content
  end

  def load_program(venue)
    CSV.parse(File.read("app/data/program_list_#{venue}.csv"), :headers=>true).map do |csv_row|
      {
        :id=> csv_row[0],
        :title=> csv_row["title"],
        :abstract=> csv_row["abstract"],
        :authors => csv_row["authors"].split(",").map{ |n| n.strip }
        #:authors=> csv_row["authors"].split(",").zip(csv_row["emails"].split(",")).map { |arr| {:name=>arr[0].strip, :email=>arr[1].strip} }
      }
    end
  end

  public
  def index

    @title = "Programs"

    @papers = load_program("papers")
    @posters = load_program("posters")
    @notes = load_program("notes")

    assert_html
  end

end
