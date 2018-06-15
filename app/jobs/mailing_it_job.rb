class MailingItJob < ApplicationJob
  queue_as :default

  def perform(article)
  	
    article.article_posted_email
  end
end
