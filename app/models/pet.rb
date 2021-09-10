class Pet < ApplicationRecord
  belongs_to :shelter
  validates :name, presence: true
  validate :no_pugs

  def no_pugs
    errors.add(:breed, "No more pugs!") if self.breed.downcase == "pug"
  end

end
