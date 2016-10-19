class Production < ApplicationRecord
  belongs_to :company

  has_attached_file :logo, styles: { xsmall: "32x32!", small: "64x64!", med: "100x100!", large: "200x200!"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end
