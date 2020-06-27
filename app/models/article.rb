class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    # Create a list of tags where each one is unique
    # and has no leading/trailing white-spaces
    tag_names = tags_string.split(",").map{ |word| word.strip.downcase }.uniq
    # Create a new tag if one doesn't already exist
    new_or_found_tags = tag_names.map{ |name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end
end