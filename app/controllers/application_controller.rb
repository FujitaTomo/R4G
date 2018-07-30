class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
  	case resource
      when User
        root_path
      when Admin
        admins_top_path
      end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  

   protected

  def search_params
    params.require(:q).permit!
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private

  def set_search
    @search = Item.ransack(params[:q])
    @items = @search.result
  end

end
