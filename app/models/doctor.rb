class Doctor < ActiveRecord::Base
  has_many :pictures, as: :picturable # Polymorphic Association

  # Has Many Through Association
  has_many :appointments
  has_many :patients, through: :appointments
end