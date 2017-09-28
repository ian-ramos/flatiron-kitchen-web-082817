class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  # accepts_nested_attributes_for :ingredients
  validates :name, presence: true

  # attr_reader :ingredient_ids

  def ingredient_ids=(ids)
    ids.each do |id|
      self.ingredients << Ingredient.find(id.to_i)
    end
  end

end
