class CallForParticipationController < ApplicationController
  before_filter :initial
  layout 'double_column'

  private
  def initial
    @banner_size = :short
    @banner_image = ["dongdaemun.jpg", "banpo.jpg"].sample

    @formatting_guideline = "http://www.cs.sfu.ca/~vis/Tasks/camera.html"
    @format_doc = "http://www.cs.sfu.ca/~vis/Templates/word_conf_vgtc_12.zip"
    @format_latex = "http://www.cs.sfu.ca/~vis/Templates/latex_conf_vgtc_080216.zip"
   
    use_common_content
  end

  public
  def index
    @title = "Call for Participation"
  end


  def paper
    @title = "Call for Papers"

    topics = YAML.load_file('app/data/topics.yaml')
    @topics = topics.keys.map{|k| {:category=>k, :list=>topics[k]}}
  end


  def visualization_note
    @title = "Call for Visualization Notes"
  end


  def poster
    @title = "Call for Posters"
  end

end
