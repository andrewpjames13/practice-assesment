class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :doctor_id
      t.datetime :date

      t.timestamps null: false
    end
  end
end
