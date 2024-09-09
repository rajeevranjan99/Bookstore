class Category < ApplicationRecord
    has_many:types

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
