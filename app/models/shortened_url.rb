class ShortenedUrl < ApplicationRecord
  validates :url, presence: true
  validates :token, presence: true
  validate :valid_url?

  before_validation :generate_token

  def to_param
    token
  end

  private

  def valid_url?
    return if is_valid_url?
    errors.add(:url, "Error -- this does not look like a valid URL")
  end

  def is_valid_url?
    URI.parse(url).host.present?
  rescue URI::InvalidURIError
    false
  end

  def generate_token
    self.token = loop do
      r_token = SecureRandom.urlsafe_base64(8)[0, 8]
      r_token.encode!("UTF-8")
      break r_token unless self.class.exists?(token: r_token)
    end
  end
end
