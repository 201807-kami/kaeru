class CartItem < ApplicationRecord
  belongs_to :item optional: true
  belongs_to :cart optional: true
end
