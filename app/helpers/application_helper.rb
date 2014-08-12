module ApplicationHelper
  def gravatar(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}"
    # link_to(image_tag(gravatar_url,class: "gravatar img-circle pull-left"),account_path(user))
    image_tag(gravatar_url, alt: user.profile.fullname, class: "gravatar img-circle pull-left")
  end

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-error',
    alert: 'alert-block',
    notice: 'alert-info'
  }

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat content_tag(:i, nil, class: "glyphicon glyphicon-#{bootstrap_icon_for(type)}")
              concat message 
            end)
    end
    nil
  end
end
