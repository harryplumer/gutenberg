module ApplicationHelper
  def nav_bar_active(section)
    return "active" if section == params[:controller]
  end 
end
