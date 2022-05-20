# Use catalan as default locale
I18n.available_locales = [:ca, :en]
I18n.default_locale = :ca
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'controllers', '*.yml').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'mails', '*.yml').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '*.yml').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'views', '*.yml').to_s]
I18n.load_path += Dir[Rails.root.join('config', 'locales', 'frontend', '*.yml')]
