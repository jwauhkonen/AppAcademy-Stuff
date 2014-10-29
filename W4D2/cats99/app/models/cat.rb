class Cat < ActiveRecord::Base
   COLORS = ["black", "white", "brown", "gray", "orange", "red", "green"]
  
  validates :birth_date, :color, :name, :sex, presence: :true
  validate :birthdate_is_valid
  validates :sex, inclusion: { in: ['M', 'F'] }
  validates :color, inclusion: { in: COLORS }
  
  has_many :cat_rental_requests, dependent: :destroy
  
  def age
    today = Date.today
    today.year - birth_date.year - (birth_date.change(year: today.year) > today ? 1 : 0)
  end
  
  private
  
    def birthdate_is_valid
      today = Date.today
      birth_date <= today
    end
end
