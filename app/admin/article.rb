ActiveAdmin.register Article do
  menu priority: 4
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).last!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  permit_params :body, :review_status, :title, :category_id, :picture, :category
  menu priority: 4
  index do
    selectable_column
    column :category
    column :title
    column :body
    column :picture
    column :user
    column :review_status
    actions
  end

  form do |f|
    f.inputs "Article Editing" do
      f.input :title
      f.input :body
      f.input :category
      f.input :picture
      f.input :review_status, as: :select, collection:  Article.review_statuses.keys, include_blank: false
    end
    f.actions
  end
end
