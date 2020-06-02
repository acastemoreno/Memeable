module ApplicationHelper
  def render_link_if_not_actual_path(url)
    url == request.path ? "#" : url
  end
end
