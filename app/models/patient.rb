class Patient < ActiveRecord::Base
  has_many :pictures, as: :picturable

  # Has Many Through Association
  has_many :appointments
  has_many :doctors, through: :appointments
end