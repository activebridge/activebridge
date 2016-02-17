ActiveAdmin.register Project do
  permit_params :description, :logo, :technology, :duration, :team_size, :client, :industry, :link, :priority, :image
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
end
