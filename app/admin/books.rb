ActiveAdmin.register Book do
  permit_params :name, :title, :content, :image, :pdf
  index do
    selectable_column
    id_column
    column :name
    column :title
    column :content
    column :image do |book|
      image_tag(book.image,style: 'height: 100px; width: 100px;') if book.image.attached? 
    end
    column :pdf do |book|
      if book.pdf.attached?
        link_to 'View PDF', rails_blob_path(book.pdf, disposition: 'inline'), target: '_blank'
      else
        'No PDF attached'
      end
    end
    actions
  end

  filter :name
  filter :title

  form do |f|
    f.inputs do
      f.input :name
      f.input :title
      f.input :content
      f.input :image, as: :file
      f.input :pdf, as: :file
    end
    f.actions
  end
end

