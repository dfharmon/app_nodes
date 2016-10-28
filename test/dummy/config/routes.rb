Rails.application.routes.draw do

  mount AppNodes::Engine => "/app_nodes"
end
