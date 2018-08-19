class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel, presence: true, format: {with: /\A[0-9-]{,14}\z/}

end
