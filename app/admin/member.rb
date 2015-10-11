ActiveAdmin.register Member do
  permit_params :name, :position, :avatar, :careers, :linkedin, :github

  show do
    p member.name
    p member.position
    cl_image_tag(member.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
  end
end
