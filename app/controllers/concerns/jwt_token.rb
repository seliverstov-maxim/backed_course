module JwtToken
  def self.encode(payload)
    JWT.encode(payload.merge(exp_at: Time.zone.now.to_i + 1.week), encode_key)
  end

  def self.decode(token)
    payload, meta = JWT.decode(token, encode_key)
    HashWithIndifferentAccess.new payload
  end

  def self.encode_key
    Rails.application.secrets.secret_key_base.to_s
  end
end
