# frozen_string_literal: true

# comment class
class Comment < ApplicationRecord
  belongs_to :post
end
