class Category < ApplicationRecord
    has_and_belongs_to_many :tests

    default_scope -> {order(title: :asc) }

    validates :title, presence: true
    
end
