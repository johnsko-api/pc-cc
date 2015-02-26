class AddAbbreviation < ActiveRecord::Migration
  def change
    add_column :regions, :abbreviation, :string, null: false
  end
end
