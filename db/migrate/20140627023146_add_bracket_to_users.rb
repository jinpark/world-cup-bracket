class AddBracketToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bracket, :json
  end
end
