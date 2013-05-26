module UserAnnouncements::MiscHelper
  
  def ua_datetime_display(datetime)
    if datetime.present?
      datetime.to_s(:short)
    else
      nil
    end
  end
  
  # Return a <br> tag if not bootstrap
  def ua_br
    "<br />".html_safe unless ua_bootstrap?
  end
  
  def flash_messages
    return nil if flash.empty?
    result = []
    flash.each do |name, msg|
      result << build_message(name, msg)
    end
    result.join("").html_safe
  end

  def build_message(msg_type, msg)
    content_tag(:div, :class => "alert alert-#{msg_type.to_s}") do
      content_tag(:a, 'x', :class => "close", "data-dismiss" => "alert") + msg.html_safe
    end
  end
  
  def ua_bootstrap?
    if params.has_key?(:bootstrap)
      params[:bootstrap] == 'true'
    else
      UserAnnouncements.config.bootstrap
    end
  end
  
end