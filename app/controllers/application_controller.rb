class ApplicationController < ActionController::Base



    private

        def view_or_redirect(page, redirect_page)
            logged_in ? render(page) : render(redirect_page)
        end

        def logged_in
            !!session[:user_id]
        end

        def current_user
            User.find_by_id(session[:user_id])
        end
end
