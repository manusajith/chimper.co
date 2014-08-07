ActiveAdmin.register Comment, :as => "ImageComment" do
  controller do
    defaults resource_class: Comment, collection_name: 'comments', instance_name: 'comment'
  end

  actions :all, except: [:new, :create, :edit, :update]

  filter :email
  filter :created_at
  filter :user_profile_first_name, :as => :string

  index do
    column :body
    actions
  end

  show do
    panel "Comment details" do
      attributes_table_for comment do
        profile = comment.user.profile
        row :fullname do
          profile.fullname
        end
        row :body
        row :created_at
      end
    end
  end

  sidebar "Image Information", only: [:show] do
    attributes_table_for comment do
      row :image do
        link_to(image_tag(comment.commentable.photo.url(:thumb)), admin_image_path(comment.commentable))
      end
      row :uploader do
        comment.commentable.user.profile.fullname
      end
      row :uploaded_at do
        comment.commentable.created_at.to_s(:short)
      end
    end
  end
end
