class ChangeColImageNullInPhoto < ActiveRecord::Migration[6.0]
  def change
    change_column_null :photos, :image, true
  end
end
