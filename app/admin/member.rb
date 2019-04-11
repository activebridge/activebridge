ActiveAdmin.register Member do
  permit_params(
    :name,
    :position,
    :avatar,
    :avatar_cache,
    :priority,
    :description,
    :projects
  )
  menu priority: 2
  config.sort_order = 'priority_asc'

  index do
    selectable_column
    column :name
    column :position
    column 'Avatar' do |member|
      cl_image_tag(member.avatar.url, width: 75, height: 90, crop: :thumb, gravity: :face)
    end
    column :priority
    actions
  end

  show do
    p member.name
    p member.position
    div cl_image_tag(member.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
  end

  form do |f|
    f.inputs 'Member Editing' do
      f.input :name
      f.input :position
      f.input :description, as: :text
      f.input :projects
      f.input :avatar, as: :file, hint: image_tag(f.object.avatar.url)
      f.input :avatar_cache, as: :hidden
      f.input :priority
    end
    f.actions
  end
end
