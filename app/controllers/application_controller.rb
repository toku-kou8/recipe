class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_up_path_for(resource)
    case resource
    when Admin
      root_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin   # ログアウト時はシンボルが返ってくる
      root_path
    when :customer  # ログアウト時はシンボルが返ってくる
      root_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name, :age, :sex, :profession])
  end
end
