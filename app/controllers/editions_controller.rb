class EditionsController < ApplicationController
  layout 'layout'
  before_filter :get_newsletter
  def get_newsletter
    @newsletter = Newsletter.find params[:newsletter_id]
  end
  def index
    @editions =  @newsletter.editions
  end
  
  def new
    if Article.all.empty?
      flash[:notice] = "There are no articles available yet, please write one first. "
      redirect_to new_article_path()
    end
    @edition = Edition.new
    @edition.newsletter_id = @newsletter
  end
  
  def edit
    @edition = Edition.find params[:id]
  end
  
  def show
    @edition = Edition.find params[:id]
    render :layout => "false" 
    
  end
  
  def create
    @edition = Edition.new
    @edition.newsletter = @newsletter
    if params and params[:articles]
      @articles = Article.find(:all, :conditions=> ["id in (?)", params[:articles] ])
      @edition.articles = @articles
    end
    respond_to do |format|
       if @edition.save
         flash[:notice] = 'Edition was successfully created.'
         format.html { redirect_to(newsletter_editions_path(@newsletter.id)) }
       else
         flash[:notice] = 'You must select at least one article'
         format.html { render :action => "new" }
       end
    end
  end
  
  def update
    
  end
  
  def destroy
    @edition = Edition.find params[:id]
    @edition.destroy 
    respond_to do |format|
      format.html { redirect_to editions_path }
      format.js
    end
    
    
  end
  
  def add_article
    article = Article.find_by_id params[:article_id]
    edition = Edition.find params[:id]
    if edition and article
      article.edition_id = edition.id
      article.save
    end
    render :partial => "articles_editions", :locals => {:newsletter => @newsletter, :edition => edition}    
  end
  
  def remove_article
    article = Article.find_by_id params[:article_id]
    edition = Edition.find params[:id]
    if edition and article
      article.edition_id = nil
      article.save
    end
    render :partial => "articles_editions", :locals => {:newsletter => @newsletter, :edition => edition}
  end
  
end
