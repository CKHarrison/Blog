class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings

  # Returning the name of the tag overriding default to_s method to join tags
  def to_s
    name # same as returning name, or self.name
  end
end
