# frozen_string_literal: true

# class addimagetoposts
class AddImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image, :string
  end
end
