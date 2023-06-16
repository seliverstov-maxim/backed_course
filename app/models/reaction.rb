class Reaction < ApplicationRecord
  enum kind: {like: 'like', dislike: 'dislike'}
  belongs_to :article
  belongs_to :user
end
