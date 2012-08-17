module Scrap
  class Railtie < Rails::Railtie
    initializer "scrap.insert_middleware" do |app|
      app.config.middleware.use "Scrap::Scrap"
    end
  end
end