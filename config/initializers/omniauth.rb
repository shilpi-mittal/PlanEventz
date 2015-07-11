OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '640811529387787', 'c4a486f10a7364b60d545a11914f3caf'
end