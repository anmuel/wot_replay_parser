I18n.load_path = Dir[File.join(__dir__, 'locale','*.yml')]
I18n.backend.load_translations
I18n.enforce_available_locales = false