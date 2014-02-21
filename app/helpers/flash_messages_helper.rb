module FlashMessagesHelper
  def flash_messages
    messages = ""
    {notice: :success, info: :info, warning: :warning, alert: :danger}.each do |type, clazz|
      if flash[type]
        messages += "<div class=\"alert alert-#{clazz}\" alert-dismissable><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>#{flash[type]}</div>"
      end
    end
    messages.html_safe
  end
end