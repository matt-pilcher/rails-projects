module UsersHelper
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=299"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
    
    #Code for custom default gravatar image
    
    #default_url = "#{root_url}/images/Avatar.png"
    #gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=200&d=#{CGI.escape(default_url)}"
    #image_tag(gravatar_url, alt: user.name, class: "gravatar")
end
