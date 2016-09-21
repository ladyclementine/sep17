if Rails.env.development? || Rails.env.test? 
  $redis = Redis.new(host: 'localhost', port: 6379, driver: :hiredis)
else
  $redis = Redis.new(url: Rails.application.secrets.redis_url)
end