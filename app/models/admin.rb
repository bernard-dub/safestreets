class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable
end
