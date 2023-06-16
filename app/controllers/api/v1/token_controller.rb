class Api::V1::TokenController < Api::V1::ApplicationController
  skip_before_action :auth_required
  protect_from_forgery with: :null_session

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      render json: {token: JwtToken.encode(user_id: user.id)}
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def permitted_parmas
    params.required(:user).permit(:email, :password)
  end
end
