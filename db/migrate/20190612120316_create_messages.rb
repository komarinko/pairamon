class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :sidecomment
      t.references :person
      t.references :sideperson
      t.timestamps null: false
    end
    add_foreign_key :messages, :users, column: :person_id
    add_foreign_key :messages, :users, column: :sideperson_id
  end
end
