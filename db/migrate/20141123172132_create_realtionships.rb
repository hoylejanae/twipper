class CreateRealtionships < ActiveRecord::Migration
  def change
    create_table :realtionships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
