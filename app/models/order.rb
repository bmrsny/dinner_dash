class Order < ActiveRecord::Base
  validates :user_id, presence: true
  validates :status, presence: true
  validates :total, presence: true
  has_many :orders_items
  has_many :items, through: :orders_items
  belongs_to :user

  scope :ordered, -> { where(status: "ordered") }
  scope :paid, -> { where(status: "paid") }
  scope :cancelled, -> { where(status: "cancelled") }
  scope :completed, -> { where(status: "completed") }
  def self.status_counts(status_type)
    group(:status).having(status: status_type).count
  end
end
