class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field text_area password_field email_field collection_select].each do |method_name|
    define_method(method_name) do |name, *args|
      options = args.extract_options!
      options[:class] =  "form-control"

      @template.content_tag :div, class: "form-group" do
        label(name) + super(name, options) + error_text(name)
      end
    end
  end

  def label(name)
    super(name, class: "control-label")
  end

  def submit_and_cancel(cancel_link, *args)
    @template.content_tag :div, class: "form-group" do
      @template.content_tag :div, class: "btn-toolbar" do
        submit(args, class: "btn btn-primary") +  cancel_link
      end
    end
  end

  private
  def error_text(attribute)
    object = @template.instance_variable_get("@#{@object_name}")
    error_text = ""
    unless object.nil?
      errors = object.errors[attribute]
      if errors
        "<label class=\"control-label has-error\">#{errors.is_a?(Array) ? errors.first : errors}</label>".html_safe
      else
        ""
      end
    end
  end
end