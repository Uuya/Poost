class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          authentication_keys: [:name]

  validates :name, presence: true, uniqueness: true, length: { maximum: 8 }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if name   = conditions.delete(:name)
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
