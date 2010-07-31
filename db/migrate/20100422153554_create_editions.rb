class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.timestamp :published_on
    end
    add_column :articles, :edition_id, :integer
  end

  def self.down
    drop_table :editions
    remove_column :articles, :edition_id, :integer
  end
end
