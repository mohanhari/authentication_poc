class UsersController  < Clearance::UsersController
  skip_before_action :require_login, only: %i[create verify_email create_password new_password email_verified], raise: false
  before_action :set_user, only: %i[create_password new_password]

  def create
    @user = user_from_params
    @user.password = SecureRandom.alphanumeric(8)
    @user.email_confirmation_token = Clearance::Token.new

    if @user.save
      redirect_back_or url_after_create
    else
      flash.now.alert = @user.errors.messages
      render template: 'users/new', status: :unprocessable_entity
    end
  end

  def status
  end

  def email_verified
    render html: 'Email has been verified already'
  end

  def verify_email
    user = User.find_by(email_confirmation_token: params[:token])
    if user.present?
      user.update(email_confirmation_token: Clearance::Token.new, email_confirmation_at: DateTime.now)
      redirect_to new_password_user_url(user)
    else
      redirect_to email_verified_users_url
    end
  end

  def create_password
    if @user.update(user_params)
      sign_in @user
      redirect_to root_url
    else
      flash.now.alert = @user.errors.messages
      render template: 'users/new_password', status: :unprocessable_entity
    end
  end

  def new_password
  end

  private

  def set_user
    @user = User.find_by(id: params[:id]) if params[:id].present?
  end

  def user_params
    params.require(:user).permit(
      :id, :first_name, :email, :password, :city
    )
  end
end
