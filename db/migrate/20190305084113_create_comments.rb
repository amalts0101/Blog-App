# frozen_string_literal: true

# Create comment migration file
class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
