Rails.application.routes.draw do
  mount Scrap::Middleware => "/stats/scrap"
end
