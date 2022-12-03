class User < ApplicationRecord
    has_secure_password

    has_many :recipes
    
    validates :username, presence: true, uniqueness: true
    validate :matching_password_confirmation

    def matching_password_confirmation
        if(!self.password_confirmation.nil? && self.password != self.password_confirmation)
            errors.add(:no_matching_password, "No matching password confirmation")
        end
    end
end