class Post < ApplicationRecord
  # 두 모델 간의 관계선언을 할 때는 단복수에 주의해야 한다.
  # 위에서와같이 has_many 다음에는 항상 복수형(posts)을 지정해야 하고,
  # belongs_to 다음에는 항상 단수형(bulletin)으로 지정해야 한다.
  belongs_to :bulletin
  mount_uploader :picture, PictureUploader
end
