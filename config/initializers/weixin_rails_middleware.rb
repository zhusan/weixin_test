# Use this hook to configure WeixinRailsMiddleware bahaviors.
WeixinRailsMiddleware.configure do |config|
  config.public_account_class = "PublicAccount"
  ## NOTE:
  ## If you config all them, it will use `weixin_token_string` default

  ## Config public_account_class if you SAVE public_account into database ##
  # Th first configure is fit for your weixin public_account is saved in database.
  # +public_account_class+ The class name that to save your public_account
  # config.public_account_class = ""

  ## Here configure is for you DON'T WANT TO SAVE your public account into database ##
  # Or the other configure is fit for only one weixin public_account
  # If you config `weixin_token_string`, so it will directly use it
  # config.weixin_token_string = '79399b5aac34bf2ceb94b8ef'
  # using to weixin server url to validate the token can be trusted.
  # config.weixin_secret_string = 'LxcwVnXGHE7yvWHUdDbXpjYaIY00wgQK'

end
