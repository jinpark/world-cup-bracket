class ChangeBracketDataTypeToText < ActiveRecord::Migration
  def change
  	change_column :users, :bracket,  :text
  end
end
