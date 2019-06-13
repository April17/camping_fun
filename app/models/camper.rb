class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups

  validate  :cant_have_symble
  validates :name, presence: true
  validates :age, numericality: {only_integer: true, greater_than: 0}

  def cant_have_symble
    symble = '! @ # $ % ^ & * ( ) _ + - = < , > . ? / |'
    symble_arry = symble.split
    symble_arry.each do |symble|
      if self.name.include?(symble)
        self.errors.add(:name, "can't include any symble")
      end
    end
  end

end
