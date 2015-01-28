class CreateSolicitors < ActiveRecord::Migration
  def change
    create_table :solicitors do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :mobile
      t.string :email
      t.references :firm, index: true

      t.timestamps null: false
    end
    add_foreign_key :solicitors, :firms
  end
end
