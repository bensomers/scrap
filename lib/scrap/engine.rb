module Scrap
  class Engine < Rails::Engine
    initializer "scrap.insert_middleware" do |app|
      app.config.middleware.use Scrap::Middleware
    end
    # endpoint Scrap::Middleware if defined? :endpoint
  end
end
