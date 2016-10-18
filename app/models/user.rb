class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :company
  validates :first_name, :last_name, presence: true

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
