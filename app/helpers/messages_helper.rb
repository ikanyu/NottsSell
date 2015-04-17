module MessagesHelper
  def receivers_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}' >#{user.email}</option>"
    end
    s.html_safe
  end
end