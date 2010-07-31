class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :title

      t.timestamps
    end
    add_column :editions, :newsletter_id, :integer
  end

  def self.down
    drop_table :newsletters
    remove_column :editions, :newsletter_id, :integer
  end
end
