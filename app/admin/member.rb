ActiveAdmin.register Member do
  permit_params(
    :name,
    :position,
    :avatar,
    :avatar_cache,
    :careers,
    :linkedin,
    :github,
    :cartoon,
    :cartoon_cache,
    :priority,
  )
  menu priority: 2
  config.sort_order = 'priority_asc'

  index do
    selectable_column
    column :name
    column :position
    column 'Avatar' do |member|
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

  form do |f|
    f.inputs 'Member Editing' do
      f.input :name
      f.input :position
      f.input :avatar, as: :file, hint: image_tag(f.object.avatar.url)
      f.input :avatar_cache, as: :hidden
      f.input :careers
      f.input :github
      f.input :linkedin
      f.input :cartoon, as: :file, hint: image_tag(f.object.cartoon.url(:logo))
      f.input :cartoon_cache, as: :hidden
      f.input :priority
    end
    f.actions
  end
end
