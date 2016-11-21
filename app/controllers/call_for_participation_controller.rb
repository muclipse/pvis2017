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

  def get_deadlines(key)
    YAML.load_file(Rails.root.join('app/data/dates.yaml'))[key].to_a.map{|e| {:name=>e[0], :time=>e[1]}}
  end

  public
  def index
    @title = "Call for Participation"

    @deadlines = {:papers=>get_deadlines("papers"), :notes=>get_deadlines("notes"), :contest=>get_deadlines("contest")}

    assert_html
  end


  def paper
    @title = "Call for Papers"

    topics = YAML.load_file(Rails.root.join('app/data/topics.yaml'))
    @topics = topics.keys.map{|k| {:category=>k, :list=>topics[k]}}
    @deadlines = get_deadlines("papers")
    assert_html
  end


  def visualization_notes
    @title = "Call for Visualization Notes"
    @deadlines = get_deadlines("notes")
    @note_committee = get_committees("note_pc_list.csv")
    assert_html
  end


  def poster
    @title = "Call for Posters"
    assert_html
  end

  def contest
    @title = "Call for Visual Storytelling Contest"
    @deadlines = get_deadlines("contest")
    assert_html
  end

end
