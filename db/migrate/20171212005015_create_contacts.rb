class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :position
      t.string :email
      t.string :company
      t.references :company, foreign_key: true
    end
  end
end
