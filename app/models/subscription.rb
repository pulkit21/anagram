class Subscription < ApplicationRecord

  scope :current_day_subscription, -> { where(created_at: (Time.now.beginning_of_day..Time.now.end_of_day)) }
  scope :check_current_day_email, -> (email) { current_day_subscription.where(email: email) }

  validates_presence_of :email
  validates_uniqueness_of :email,
    message: I18n.t("subscription.email_present"),
    if: Proc.new { |user| Subscription.check_current_day_email(user.email).first.present? }

  before_create :set_head_number
  after_create :give_away_prizes_to_subscribers

  def give_away_prizes_to_subscribers

  end

  #######
  private
  #######

  # Set sequence number to user per day
  def set_head_number
    subscriptions =   Subscription.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day)
    if subscriptions.present?
      subscriptions = subscriptions.order("head_number DESC").first
      self.head_number = subscriptions.head_number + 1
    else
      self.head_number = 1
    end
  end
end
