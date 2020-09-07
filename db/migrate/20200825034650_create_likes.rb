class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.bigint :likeable_id
    end

    add_index :likes, [:likeable_type, :likeable_id]
    add_reference :likes, :user, foreign_key: true
  end
end
