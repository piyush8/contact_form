class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :string
      t.string :email
      t.string :mobile
      t.text :message

      t.timestamps
    end
  end
end
