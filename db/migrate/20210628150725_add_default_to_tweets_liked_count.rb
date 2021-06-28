class AddDefaultToTweetsLikedCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tweets, :liked_count, 0
  end
end
