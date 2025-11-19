class RenameNameColumnInTweets < ActiveRecord::Migration[7.1]
  
  def change
    rename_column :tweets, :name, :tweet_name
  end
end
