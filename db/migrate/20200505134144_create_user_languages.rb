class CreateUserLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_languages do |t|
      t.string :ip_address
      t.string :language
      t.timestamps
    end
  end
end
