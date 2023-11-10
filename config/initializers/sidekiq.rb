if ENV['REDIS_HOST'] && !ENV['REDIS_HOST'].empty? 
  Sidekiq.configure_server do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      # port: ENV['REDIS_PORT'] || '6379'
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      host: ENV['REDIS_HOST'],
      # port: ENV['REDIS_PORT'] || '6379'
    }
  end
end