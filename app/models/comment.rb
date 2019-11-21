class Comment < ApplicationRecord
  # bin/rails g model Comment post:references body:text
  # post:references라고 모델 속성을 지정했는데,
  # 이것은 post_id라는 속성을 만들고 이 속성을 foreign key로 사용하도록 해 준다.
  # 그리고 해당 모델(Comment) 클래스에는 belongs_to :post라는 관계선언을 자동으로 추가해 준다.
  belongs_to :post

  # 유효성 검증 -> 내용 입력하지 않으면 에러처리
  validates :body, presence: true
end
