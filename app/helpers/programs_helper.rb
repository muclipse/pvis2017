module ProgramsHelper
  def session(index, rowspan=1)
    "<td class='session' rowspan=#{rowspan}>
    <a href=#session_#{index}>
    <div class='session'>Papers & Notes</div><div class='session_title'>#{@session_ordered_names[index]}</div></td></a>".html_safe
  
  end

  def cell_coffee(colspan=1)
    "<td class='coffee' colspan=#{colspan}>Coffee break</td>".html_safe
  end
end
