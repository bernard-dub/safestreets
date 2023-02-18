class Poster < ApplicationRecord
  acts_as_taggable_on :places
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
  before_create do
    self.score = 0
  end
end
