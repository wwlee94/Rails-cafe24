class Bulletin < ApplicationRecord
  # 두 모델 간의 관계선언을 할 때는 단복수에 주의해야 한다.
  # 위에서와같이 has_many 다음에는 항상 복수형(posts)을 지정해야 하고,
  # belongs_to 다음에는 항상 단수형(bulletin)으로 지정해야 한다.

  # 단, 이와 같이 두 모델의 관계를 선언하는 것만으로 실제 DB 테이블이 자동으로 연결되지 않는다.
  # 즉, 관계형 데이터베이스에서 두 테이블이 관계를 가지기 위해서는
  # 자식 테이블 필드 중에 부모 테이블의 id를 외래키(foreign key)로 가지고 있어야 한다.


  has_many :posts, dependent: :destroy # destroy -> bulletin 삭제할때 posts도 cascade로 같이 삭제한다는 의미
  as_enum :post_type , bulletin: 0, blog: 1, gallery: 2
  # enum post_type: {Bulletin: 0, Blog: 1, Gallery: 2}
  #
  # 유효성 검증 -> 내용 입력하지 않으면 에러처리
  validates :title, presence: true
  validates :description, presence: true
end
