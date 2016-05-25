module CallForPaperHelper
  def submission_system_button
    content_tag :div, (link_to (content_tag :span, "Submission System", :class=>"button"), "https://precisionconference.com/~vgtc", :target=>:blank), :class=>"submission_system_button"
  end

end
