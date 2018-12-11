# freeze_string_literals: true

# Help static_pages view
module StaticPagesHelper
  
 # Return full http title.
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
