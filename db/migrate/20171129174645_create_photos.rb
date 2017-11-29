class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.column :title, :string
      t.column :user_id, :integer
    end
  end
end
