class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :patient      
      t.timestamp  :appointment_created_at
      t.timestamp  :appointment_at
    end
  end
end
