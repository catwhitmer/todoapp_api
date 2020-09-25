class Todo < ApplicationRecord

    validates :notes, presence: true
end
