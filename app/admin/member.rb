ActiveAdmin.register Member do
  permit_params :name, :position, :avatar, :careers, :linkedin, :github, :cartoon

  index do
    selectable_column
    column :name
    column :position
    column "Avatar" do |member|
      cl_image_tag(member.avatar.url, width: 100, height: 100, crop: :thumb, gravity: :face)
    end
    actions
  end

  show do
    p member.name
    p member.position
    div cl_image_tag(member.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
    div cl_image_tag(member.cartoon, width: 100, height: 150, crop: :thumb)
  end
end
