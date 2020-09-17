class ChangeImageColInPhoto1 < ActiveRecord::Migration[6.0]
  def change
    change_column_null :photos, :image, false
  end
end
