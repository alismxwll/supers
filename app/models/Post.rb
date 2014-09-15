class Post < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :content, presence: true
  validates_uniqueness_of :title
  belongs_to :user

  def self.search(find)
    where("title like ?", "%#{find}%")
  end

end
