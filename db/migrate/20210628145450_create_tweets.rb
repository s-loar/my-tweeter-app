class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :liked_count
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
