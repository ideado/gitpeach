require 'pusher'

config_file = File.join(Rails.root, "config", "pusher.yml")
if File.exists?(config_file)
  pusher_config = YAML.load_file(config_file).with_indifferent_access
  Pusher.app_id = pusher_config[Rails.env][:app_id]
  Pusher.key    = pusher_config[Rails.env][:key]
  Pusher.secret = pusher_config[Rails.env][:secret]
else
  Pusher.app_id = ENV["PUSHER_APP_ID"]
  Pusher.key    = ENV["PUSHER_KEY"]
  Pusher.secret = ENV["PUSHER_SECRET"]
end

Pusher.logger = Rails.logger
