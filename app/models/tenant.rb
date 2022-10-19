class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases

    validates :name, presence: { message: "Name must be present" }
    validates :age, numericality: { greater_than_or_equal_to: 18, message: "Must be at least 18 to rent" }
end
