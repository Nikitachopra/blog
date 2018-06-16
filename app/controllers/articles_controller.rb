class ArticlesController < ApplicationController
#	  include Knock::Authenticable
#skip_before_action :authenticate_user!


	WillPaginate.per_page = 10
	def index
		respond_to do |format|
			format.html { @articles = Article.where(user: current_user).paginate(:page => params[:page]) }
			format.json { render json: Article.all }
		end
		#@articles = current_user.articles.all
	end

	def show
		respond_to do |format|
			format.html { @article = Article.find(params[:id]) }
			format.json { render json: Article.find(params[:id]) }
		end
		
	end

	def new
		@article = Article.new
	end


	def create
	  @article = Article.new(article_params)
	 # @article.user = current_user
	  saved = @article.save
	  respond_to do |format|
		  format.html { 
		  	if saved
			  	ArticleMailer.article_posted_email(@article.id).deliver_now
			  	redirect_to @article
			  else
			  	render :new
			  end 
			}
			format.json { render json: @article}
		end
  end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private

	def article_params
		
		params.require(:article).permit(:title, :text, :avatar, :user_id)
	end

end
