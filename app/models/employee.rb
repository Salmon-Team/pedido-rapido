class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates_presence_of :name, :kind, :status

  enum kind:   { admin: 1, attendant: 2, cook: 3 }
  enum status: { active: 1, inactive: 2 }
end
