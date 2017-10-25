class AddReferencesUserTweets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tweets, :user, foreign_key: true, index: true
  end
end
