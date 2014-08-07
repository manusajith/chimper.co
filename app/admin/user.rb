ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  actions :all, except: [:new, :create, :edit, :update]

  filter :email
  filter :created_at
  filter :profile_first_name, :as => :string


  index do
    column :email
    actions
  end


  show do
    panel "Profile details" do
      attributes_table_for user do
        profile = user.profile
        row :fullname do
          profile.fullname
        end
        row :email
        row :dob do
          profile.dob rescue ""
        end
        row :website do
          profile.website
        end
        row :bio do
          profile.bio
        end
      end
    end
  end
  # sidebar "User Information", only: [:show] do
  #   attributes_table_for user do
  #     row :fullname do
  #       user.profile.fullname
  #     end
  #     row :email
  #   end
  # end

end
