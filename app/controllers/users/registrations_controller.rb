class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :check_registration_limit, only: [:new, :create]
  
  def create
    super  #call the parent
    @user = resource
    #make the first user the Manager. everyone else is Athlete
    if User.count == 1
      resource.role = "Admin"   #resource refers to user
    else
     resource.role = "Pending"
    end
    resource.save
  end
  
  protected

  def check_registration_limit
    if User.count == 5
      if user_signed_in?
        redirect_to projects_url
      else
        flash[:danger] = "Η εγγραφή δεν είναι δυνατή"
        redirect_to root_path
      end
    end  
  end

end