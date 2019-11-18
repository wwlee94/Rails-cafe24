Rails.application.routes.draw do
  resources :posts
  # root 라우트 정의는 routes.rb 파일에서 최상위에 위치해야 한다.
  root 'welcome#index'
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
