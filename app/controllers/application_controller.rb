class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def use_common_content
     @show_common_content =true
     @sponsors = Sponsor.all.order("position asc").map{|s| {:name=>s.name, :thumbnail=>s.thumbnail.url, :url=>s.url}}
     @upcoming_deadlines = YAML.load_file(Rails.root.join('app/data/dates.yaml'))['upcoming'].to_a.map{|e| {:name=>e[0], :time=>e[1]}}  
  end

  def assert_html(layout=nil)
    respond_to do |format|
      if layout.nil?
        format.html
      else
        format.html { render layout: layout }
      end
      
      format.all { render nothing: true, status: 404 }
    end
  end

end
