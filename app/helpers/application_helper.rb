module ApplicationHelper

    def label_with_field(obj, field, name)
        content_tag(:label, name.capitalize)
        content_tag("#{field}_field".to_sym, name.capitalize)

    end

    def signed_in_user
        User.find_by_id(session[:user_id])
    end
        
end
