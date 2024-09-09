class Book < ApplicationRecord
  self.table_name = :books
  has_one_attached :image
  has_one_attached :pdf

  # def self.ransackable_associations(auth_object = nil)
  #   ["content", "created_at", "name", "title", "updated_at"]
  # end
  def self.ransackable_attributes(auth_object = nil)
    super + _ransackers.keys
  end
end
