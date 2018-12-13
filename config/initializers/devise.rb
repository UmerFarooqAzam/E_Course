Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.mailer_sender = 'laaraj <no-reply@protonmail.com>'
  config.stretches = Rails.env.test? ? 1 : 11

 
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/


  config.reset_password_within = 6.hours

  config.sign_out_via = :delete


  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2 ,'138881159061-npmt5jnqebf1p54m13b900s10i80cte7.apps.googleusercontent.com' ,'5xc24puOPm-RCPwDE8uFIE3V',{access_type: "offline",approval_prompt:""}
  require 'omniauth-facebook'
  config.omniauth :facebook ,'260738267943155','57772b171c96bbf7785e9073d28e2d32'
end
