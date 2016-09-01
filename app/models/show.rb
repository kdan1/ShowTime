class Show < ActiveRecord::Base
  validates :name, presence: true
  validates :synopsis, presence: true
  validates :episodes, presence: true, numericality: {only_integer: true}
  validates :score, presence: true, numericality: true
end
