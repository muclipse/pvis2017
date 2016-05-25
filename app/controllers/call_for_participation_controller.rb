class CallForParticipationController < ApplicationController
  before_filter :initial
  layout 'double_column'

  private
  def initial
    @banner_size = :short
    @banner_image = "dongdaemun.jpg"
   
    use_common_content
  end

  public
  def index
    @title = "Call for Participation"
  end


  def paper
    
  end


  def visualization_note
    
  end


  def poster
    
  end

end
