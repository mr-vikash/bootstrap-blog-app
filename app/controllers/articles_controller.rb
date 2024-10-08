class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @article = Article.new #this line is used for resolved from nil instance error
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = User.first.id;
    if @article.save
      flash[:notice] = "Article Created Successfully"
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article Updated Successfully"
      redirect_to article_path(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
      if (current_user != @article.user) && (current_user.admin? == false)
        flash[:alert] = "You can only edit or delete your own article"
        redirect_to @article
      end
  end
end