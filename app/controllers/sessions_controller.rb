class SessionsController < Clearance::SessionsController

  skip_before_action :require_login
  # POST /sign_in
  def create
    @user = authenticate(params)
    sign_in(@user) do |status|
       if status.success?
        redirect_back_or url_after_create
      else
        flash.now.alert = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy
  end

  def new
    render template: "sessions/new"
  end
end
