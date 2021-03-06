# config/initializers/facebook_messenger.rb
unless Rails.env.production? || Rails.env.test?
  bot_files = Dir[Rails.root.join("app", "bot", "**", "*.rb")]
  bots_reloader = ActiveSupport::FileUpdateChecker.new(bot_files) do
    bot_files.each{ |file| require_dependency file }
  end

  bot_files.each { |file| require_dependency file }
end