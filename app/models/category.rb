class Category < ActiveRecord::Base
  include Paperclip::Glue
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :image, :meta_description, :name, :title, :description, :permalink
  has_many :lexiques

  validates :permalink, :uniqueness => true, :presence => true
  validates :name, :uniqueness => true, :presence => true
  validates :title, :uniqueness => true, :presence => true
end
