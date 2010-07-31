class Edition < ActiveRecord::Base
  has_many :articles
  belongs_to :newsletter
  validate :at_least_one_article, :on => :create
  
  def at_least_one_article
    errors.add_to_base("Must have at least one article") unless articles.size>0
  end
  
  def fulltitle
    n=Newsletter.find_by_id self.newsletter_id
    "Edition N°"+id.to_s+" of "+n.title
  end
end
  
