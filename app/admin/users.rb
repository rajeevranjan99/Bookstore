ActiveAdmin.register User do

 
  permit_params :name, :username, :email, :password_digest
  
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :password_digest
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :email

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password_digest
    end
    f.actions
  end
end
