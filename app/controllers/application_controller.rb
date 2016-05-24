class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def use_common_content
     @show_common_content =true
     @sponsors = Sponsor.all.order("position asc").map{|s| {:name=>s.name, :thumbnail=>s.thumbnail.url, :url=>s.url}}
  end
  
end
