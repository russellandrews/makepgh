class AddPhotoToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :avatar, :string
  end
end
