class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  validates :first_name, :last_name, presence: true
  accepts_nested_attributes_for :company

  has_attached_file :avatar, styles: { xsmall: "32x32!", small: "64x64!", med: "100x100!", large: "200x200!"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # Enum for user permission levels (admin: 0, editor: 1, viewer: 2)
  enum permission: [:administrator, :editor, :viewer]

  def self.permission_list
    return [
      ["Administrator", :administrator],
      ["Editor", :editor],
      ["Viewer", :viewer]
    ]
  end

  def name
    return "#{self.first_name} #{self.last_name}"
  end
end
