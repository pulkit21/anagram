class Subscription < ApplicationRecord

  scope :current_day_subscription, -> (email) { where(email: email, created_at: (Time.now.beginning_of_day..Time.now.end_of_day)) }

  validates_presence_of :email
  validates_uniqueness_of :email,
    message: I18n.t("subscription.email_present"),
    if: Proc.new { |user| Subscription.current_day_subscription(user.email).first.present? }

end
