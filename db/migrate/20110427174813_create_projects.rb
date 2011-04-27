class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.boolean :state
      t.integer :bids
      t.string :cipher

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
