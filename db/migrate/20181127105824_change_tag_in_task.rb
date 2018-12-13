class ChangeTagInTask < ActiveRecord::Migration[5.2]
  def change
  	change_column :tasks ,:tag ,:integer
  end
end
