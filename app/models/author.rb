class Author < ActiveRecord::Base
    # presence: validates that name is required
    # uniqueness validates no two authors have the same name

    validates :name, presence: true, uniqueness: true 
    validates :phone_number, length: { is: 10 }
end
