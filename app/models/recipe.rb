class Recipe< ApplicationRecord
    validates :name,:description, presence: true
    belongs_to :chef
    validates :chef_id, presence: true
end