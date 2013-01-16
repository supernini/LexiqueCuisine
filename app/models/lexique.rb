class Lexique < ActiveRecord::Base
  include Paperclip::Glue
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :permalink, :image, :description, :keywords, :meta_description, :name, :published_at, :short_description, :title, :published_at, :family, :synonyme, :category_id, :courant, :home_view, :first_letter
  scope :published, lambda { where(['ISNULL(published_at) or published_at<=?', Date.today]).order('name asc') }
  belongs_to :category
  has_many :comments


  validates :permalink, :uniqueness => true, :presence => true
  validates :name, :uniqueness => true, :presence => true
  validates :title, :uniqueness => true, :presence => true
  validates :first_letter, :presence => true
end
