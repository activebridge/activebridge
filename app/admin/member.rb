ActiveAdmin.register Member do
  permit_params :name, :position, :avatar, :careers, :linkedin, :github, :cartoon, :priority
  menu priority: 2
  config.sort_order = 'priority_asc'

  index do
    selectable_column
    column :name
    column :position
    column "Avatar" do |member|
      cl_image_tag(member.avatar.url, width: 100, height: 100, crop: :thumb, gravity: :face)
    end
    column :priority
    actions
  end

  show do
    p member.name
    p member.position
    div cl_image_tag(member.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
    div cl_image_tag(member.cartoon, width: 100, height: 150, crop: :thumb)
  end
end
