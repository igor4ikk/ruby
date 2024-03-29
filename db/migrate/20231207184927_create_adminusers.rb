class CreateAdminusers < ActiveRecord::Migration[7.0]
  def change
    create_table :adminusers do |t|
      t.string :email, null: false, index: {unique: true}
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
