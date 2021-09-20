class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user
      user_path(current_user)
    else
      admins_users_index_path
    end
  end

  def after_sign_out_path_for(resource)
    if current_user
      new_user_session_path
    else
      new_admin_session_path
    end
  end
end
