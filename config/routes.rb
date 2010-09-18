Rails.application.routes.draw do |map|
  match 'async/:tag' => 'async#show'
end
