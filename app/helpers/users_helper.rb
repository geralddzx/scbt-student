module UsersHelper
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :street, :city, :country, :postal_code, :phone, :referral)
  end
end
