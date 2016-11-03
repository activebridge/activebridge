Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(
  active_admin.js
  application.js
  application.css
  blog.js
  blog.css
  mobile.js
  mobile.css
  fonts.css
  sw.js
)

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
