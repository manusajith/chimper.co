ActiveAdmin.register Image do

  actions :all, except: [:new, :create, :edit, :update]

  filter :name
  filter :created_at
  filter :user_profile_first_name, :as => :string
  filter :user_email, as: :select, collection: User.all.map(&:email)

  index :as => :grid do |image|
    link_to(image_tag(image.photo.url(:thumb)), admin_image_path(image))
  end

end
