module ApplicationHelper
  def subheader(title, tail=nil)
    render :partial=>"application/subheader", :locals=>{:title=>title, :tail=>tail}
  end

  def end_back_link(text, url)
    render :partial=>"application/end_back_link", :locals=>{:text=>text, :url=>url}
  end
end
