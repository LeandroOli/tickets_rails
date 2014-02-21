module ApplicationHelper
  def active_path(path)
    "active" if current_page?(path)
  end

  def cancel_link(path)
    link_to "Cancel", path, class: "btn btn-danger", data: { confirm: "Are you sure you want to cancel the operation?" }
  end

  def error_explanation(model)
    if model.errors.any?
      content_tag :div, id: "error_explanation", class: "alert alert-danger" do
        "The operation could not be performed because one or more error(s) occurred."
      end
    end
  end


end
