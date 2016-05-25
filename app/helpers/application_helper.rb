module ApplicationHelper
  def subheader(title, tail=nil)
    render :partial=>"application/subheader", :locals=>{:title=>title, :tail=>tail}
  end
end
