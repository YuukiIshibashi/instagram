module ApplicationHelper
  def user_profile_img(user)
    unless user.provider.blank?
      img_url = 'user.image_url'
    else
      img_url = 'no_image.png'
    end
    image_tag(user.avatar, alt: user.name)
  end
end
