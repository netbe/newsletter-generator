class HomeController < ApplicationController
  layout "layout"
  def index
    @newsletters = Newsletter.find :all
    @articles = Article.find :all
    
  end
end
