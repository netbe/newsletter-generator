class Article < ActiveRecord::Base
    belongs_to :edition
    file_column :image, :magick => { 
              :versions => { "thumb" => "50x50",
                             "medium" => "300x200",
                             "large" => "640x480>"}
                           }
    
    def self.unpublished
      Article.find :all, :conditions => ["edition_id IS NULL"]
    end
end
