class ArticleMailer < ApplicationMailer
	#default from: 'chopra.nikita5@gmail.com'

	def article_posted_email(article_id)

		@article = Article.find_by(id: article_id)
		mail(to: 'chopra.nikita5@gmail.com', subject: 'Article Posted')
	end
end
