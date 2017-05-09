class Product < ApplicationRecord
  validates :title, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :category

  has_many :groupships
  has_many :groups, through: :groupships
     before_validation :generate_friendly_id, :on => :create
     validates_presence_of :friendly_id
    #  validates_uniqueness_of :friendly_id
     validates_format_of :friendly_id, :with => /\A[a-z0-9\-]\z/

     has_many :tickets, :dependent => :destroy
     accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank
      def to_param
       self.friendly_id
      end

     protected

     def generate_friendly_id
       self.friendly_id ||= SecureRandom.uuid
     end


end
