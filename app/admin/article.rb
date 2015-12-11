ActiveAdmin.register Article do
  permit_params :body, :review_status
  menu priority: 4
  index do
    selectable_column
    column :title
    column :body
    column :review_status
    actions
  end

  form do |f|
    f.inputs "Article Editing" do
      f.input :title
      f.input :body
      f.input :review_status, as: :select, collection:  Article.review_statuses.keys, include_blank: false
    end
    f.actions
  end
end
