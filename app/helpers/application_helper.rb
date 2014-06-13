module ApplicationHelper

  def flash_class(key)
    case key
    when :notice then
      'alert alert-info'
    when :success then
      'alert alert-success'
    when :error then
      'alert alert-danger'
    when :alert then
      'alert alert-danger'
    end
  end

  def ehr_error_messages(flash)
    html = "<div class='row'>"
    flash.each do |key, value| 
      html += <<-HTML
        <div class="alert alert-info fade in" id="flash_#{value}">
            <button type='button' class='close' data-dismiss='alert'>&times;</button>
            #{value}
        </div>      
      HTML
    end

    html.html_safe
   end
  
end
