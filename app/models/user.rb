class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          authentication_keys: [:name]

  validates_uniqueness_of :name
  validates_presence_of   :name

  has_many :posts

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
