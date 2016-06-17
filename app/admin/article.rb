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

  permit_params :body, :review_status, :title, :picture, :picture_cache, :category, :member_id, :member
  menu priority: 4
  index do
    selectable_column
    column :category
    column :title
    column :body do |article|
      truncate(strip_tags(article.body), length: 100)
    end
    column :picture
    column :member
    column :review_status
    actions
  end

  form do |f|
    f.inputs 'Article Editing' do
      f.input :title
      f.input :body, input_html: { id: 'simplemde' }
      f.input :member
      f.input :category, as: :select, collection: Article.categories.keys
      f.input :picture, as: :file, hint: image_tag(f.object.picture.url(:logo))
      f.input :picture_cache, as: :hidden
      f.input :review_status, as: :select, collection: Article.review_statuses.keys, include_blank: false
    end
    f.actions
  end
end
