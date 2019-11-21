Rails.application.routes.draw do

  # root 라우트 정의는 routes.rb 파일에서 최상위에 위치해야 한다.
  root 'welcome#index'
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :posts do
    resources :comments, only: [:create, :destroy] # 특정 액션에만 라우트 설정해두기 나머지는 필요 없으니까!
  end

  resources :posts

  resources :bulletins do
    resources :posts
  end

end
