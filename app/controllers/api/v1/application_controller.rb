class Api::V1::ApplicationController < ActionController::Base
  before_action :auth_required

  def auth_required
    jwt_source = request.headers[:auth]
    return render_unauthorize if jwt_source.blank?

    jwt_payload = JwtToken.decode(jwt_source)
    return render_unauthorize if jwt_payload.blank?

    id = jwt_payload[:user_id]
    return render_unauthorize if id.blank?
    return render_unauthorize unless User.exists?(id)
  end

  def current_user
    @current_user ||= User.find(JwtToken.decode(request.headers[:auth])[:user_id])
  end

  def render_unauthorize
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
