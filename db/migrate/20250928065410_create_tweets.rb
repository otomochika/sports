class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.text :menue
      t.text :detail
      

      t.timestamps
    end
  end
end
