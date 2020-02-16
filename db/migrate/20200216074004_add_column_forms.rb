class AddColumnForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :item, :string
    add_column :forms, :isbought, :integer
    add_column :forms, :other, :string
    add_column :forms, :catalog, :integer
    add_column :forms, :furigana, :string
    add_column :forms, :gender, :string
    add_column :forms, :age, :integer
    add_column :forms, :postnumber, :integer
    add_column :forms, :address, :string
    add_column :forms, :tel, :integer
    add_column :forms, :mail, :string
    add_column :forms, :bake, :integer
    add_column :forms, :cheese3, :integer
    add_column :forms, :cheese6, :integer
    add_column :forms, :satisfied, :integer
  end
end
