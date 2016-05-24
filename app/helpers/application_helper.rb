module ApplicationHelper
  def subheader(title, link=nil)
    render :partial=>"application/subheader", :locals=>{:title=>title}
  end
end
