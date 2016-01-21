ActiveAdmin.register User do
  menu priority: 3
  permit_params  :first_name, :last_name, :email, :role

  form do |f|
    f.inputs "User Editing" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :role, as: :select, collection: User.roles.keys, include_blank: false
    end
    f.actions
  end
end
