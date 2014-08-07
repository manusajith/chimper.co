module ApplicationHelper
  def gravatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}"
    # link_to(image_tag(gravatar_url,class: "gravatar img-circle pull-left"),account_path(user))
    image_tag(gravatar_url, alt: user.profile.fullname, class: "gravatar img-circle pull-left")
  end
end
