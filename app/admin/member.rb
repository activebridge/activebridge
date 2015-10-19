ActiveAdmin.register Member do
  permit_params :name, :position, :avatar, :careers, :linkedin, :github, :cartoon

  show do
    p member.name
    p member.position
    div cl_image_tag(member.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
    div cl_image_tag(member.cartoon, width: 100, height: 150, crop: :thumb)
  end
end
