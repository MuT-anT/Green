class Recipe< ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length: {minimum: 20}
    belongs_to :chef
    validates :chef_id, presence: true
    default_scope -> {order(updated_at: :desc)}
    has_many :recipe_ingrediants
    has_many :ingrediants , through: :recipe_ingrediants
    has_many :comments, dependent: :destroy
end