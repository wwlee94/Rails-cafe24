class AddPostTypeToBulletins < ActiveRecord::Migration[6.0]
  def change
    add_column :bulletins, :post_type, :string
  end
end
