class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.column :tag, :string
      t.column :photo_id, :integer
    end
  end
end
