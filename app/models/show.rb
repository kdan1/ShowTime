class Show < ActiveRecord::Base
  #validateions for creating a new show
  validates :name, presence: true
  validates :synopsis, presence: true
  validates :episodes, presence: true, numericality: {only_integer: true}
  validates :score, presence: true, numericality: true

  #for paperclip gem
  #for future implementation
  #has_attached_file :show_img, styles: { medium: "250x300>", thumb: "125x150>" }
  #validates_attachment_content_type :show_img, content_type: /\Aimage\/.*\z/
end
