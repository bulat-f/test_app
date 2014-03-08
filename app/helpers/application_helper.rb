module ApplicationHelper

  def full_title(page_title)
    base_title = 'Test app'
    unless page_title.blank?
      "#{ base_title } | #{ page_title }"
    else
      base_title
    end
  end

end
