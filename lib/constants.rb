# Module for constants.
module Constants
  # Maximum length of a micropost.
  MAX_STRING_LEN_MICROPOST = 140

  # Maximum length of an email.
  MAX_STRING_LEN_EMAIL = 244

  # Maximum length of user name.
  MAX_STRING_LEN_USER_NAME = 50

  # Minimum length of a password.
  MIN_STRING_LEN_PASSWORD = 6

  # Page title heading.
  PAGE_TITLE = 'Ruby on Rails Tutorial Sample App'

  # Regex valid email.
  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end
