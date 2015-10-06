ActiveAdmin.register User do
  permit_params :name, :position, :avatar

  show do
    p user.name
    p user.position
    cl_image_tag(user.avatar, width: 100, height: 150, crop: :thumb, gravity: :face)
  end
end
