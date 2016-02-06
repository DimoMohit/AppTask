module ApplicationHelper
  def is_current_page(path)
    if request.url == path || request.path == path
      return 'active todo-done'
    end
  end
end
