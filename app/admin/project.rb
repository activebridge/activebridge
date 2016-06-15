ActiveAdmin.register Project do
  permit_params :description, :logo, :logo_cache, :technology, :duration, :team_size, :client, :industry, :link, :priority, :image, :image_cache
  menu priority: 3
  config.sort_order = 'priority_asc'

  index do
    selectable_column
    column :title
    column :description
    column 'Logo' do |project|
      cl_image_tag(project.logo.url, width: 150, crop: :thumb)
    end
    column 'Link' do |project|
      link_to project.link, project.link
    end
    column :priority
    actions
  end

  form do |f|
    f.inputs 'Project Editing' do
      f.input :description
      f.input :logo, as: :file, hint: image_tag(f.object.logo.url(:logo))
      f.input :logo_cache, as: :hidden
      f.input :technology
      f.input :duration
      f.input :team_size
      f.input :client
      f.input :industry
      f.input :link
      f.input :priority
      f.input :image, as: :file, hint: image_tag(f.object.image.url(:logo))
      f.input :image_cache, as: :hidden
    end
    f.actions
  end
end
