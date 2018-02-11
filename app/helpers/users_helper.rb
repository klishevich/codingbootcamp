module UsersHelper
  def pref_and_full_name(user)
    content_tag(:span, concat_name(user))
  end

  def pref_and_full_name_link(user, url)
    link_to(concat_name(user), url)
  end

  private
  def concat_name(user)
    if (user.preferred_name.blank?)
      user.full_name
    elsif (user.full_name.blank?)
      user.preferred_name
    else
      "#{user.preferred_name} (#{user.full_name})"
    end
  end
end
