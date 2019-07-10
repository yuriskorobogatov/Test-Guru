class Badge < ApplicationRecord
  belongs_to :rule
  belongs_to :author, class_name: 'Admin', foreign_key: :user_id
end
