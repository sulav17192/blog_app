class Post < ApplicationRecord
  belongs_to :user

  attribute :status, :integer
  enum :status, { draft: 0, published: 1 }
end
