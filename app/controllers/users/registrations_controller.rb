class Users::RegistrationsController < Devise::RegistrationsController


  def create
    super  #call the parent
    debugger
    @user = resource
    #make the first user the Manager. everyone else is Athlete
    if User.count == 1
      resource.role = "Admin"   #resource refers to user
    else
     resource.role = "User"
    end
    resource.save
  end


end