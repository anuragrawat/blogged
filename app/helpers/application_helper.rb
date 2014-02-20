module ApplicationHelper

  def article_status x
    x ? 'Published' : 'Unpublished'
  end
end
