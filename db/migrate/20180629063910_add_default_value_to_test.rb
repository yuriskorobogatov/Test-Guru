class AddDefaultValueToTest < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:tests, :title, 1)
  end
end
