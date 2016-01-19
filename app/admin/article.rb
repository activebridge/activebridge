ActiveAdmin.register Article do
  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).last!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

  permit_params :body, :review_status, :title, :category_id
  menu priority: 4
  index do
    selectable_column
    column :title
    column :body
    column :category
    column :review_status
    actions
  end

  form do |f|
    f.inputs "Article Editing" do
      f.input :title
      f.input :body
      f.input :category_id
      f.input :review_status, as: :select, collection:  Article.review_statuses.keys, include_blank: false
    end
    f.actions
  end
end
