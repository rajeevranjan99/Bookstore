ActiveAdmin.register Type do
  permit_params :name, :description, :category_id
 
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category_id
    actions
  end

  filter :name
  filter :description
  filter :category_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :category_id, as: :select, collection: Category.pluck(:name, :id),include_blank: false
    end
    f.actions
  end
end
