class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def find_resource
      class_name = params[:controller].singularize
      klass = class_name.camelize.constantize
      self.instance_variable_set "@" + class_name, klass.find(params[:id])
    end
end
