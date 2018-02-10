Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    '11q6Z6vZc6MJnxzBWgcGURikadLnibg5',
    'xDbtB-lSbwQwGK-Wh61mJvhikJ09nwa2E43GBpMOH-6cMpM7NhtBSEbH6SygSGW3',
    'peac.auth0.com',
    callback_path: "/auth/oauth2/callback",
    authorize_params: {
      scope: 'openid profile',
      audience: 'https://peac.auth0.com/userinfo'
    }
  )
end
