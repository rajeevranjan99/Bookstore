class Type < ApplicationRecord
  self.table_name =:types
  belongs_to :category
  def self.ransackable_attributes(auth_object = nil)
    ["description", "category_id" , "name"]
  end

 
end
