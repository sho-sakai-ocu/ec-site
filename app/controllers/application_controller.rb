class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  def after_sign_in_path_for(resource) 
    if resource.is_a?(Admin)
        admin_root_path
    else
        customers_my_page_path
    end
  end
  
  def after_sign_out_path_for(resource)
    if resource == :customer
        root_path
    elsif resource == :admin
        admin_root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number]) # 注目
  end
end
