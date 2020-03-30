class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :rating, numericality: { only_integer: true }
  after_create :calculate_cocktail_rating

  def calculate_cocktail_rating
    cocktail = self.cocktail
    number_of_reviews = cocktail.reviews.count
    sum_of_review_ratings = 0
    cocktail.reviews.each do |review|
      sum_of_review_ratings += review.rating
    end
    cocktail.average_rating = sum_of_review_ratings / number_of_reviews.to_f
    cocktail.save
    # Sum of all review ratings / number of review ratings
  end
end
