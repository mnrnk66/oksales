require 'kconv'

class Client < ActiveRecord::Base
  before_validation :to_utf8

  validates :name, presence: true, length: { maximum: 255 }
  validates :abbr, length: { maximum: 255 }
  validates :code, length: { maximum: 255 }, uniqueness: true, allow_blank: true
  validates :full_name, length: { maximum: 255 }
  validates :full_name_kana, length: { maximum: 255 }, format: {with: /\A[\p{katakana}ー－]+\z/, message: :invalid_katakana_format}, allow_blank: true
  validates :zipcode, format: { with: /\A[0-9]{7}\z/, message: :invalid_zipcode_format }, allow_blank: true
  validates :pref_name, length: { maximum: 255 }
  validates :address_city, length: { maximum: 255 }
  validates :address_extra, length: { maximum: 255 }
  validates :sales_person_name, length: { maximum: 255 }
  validates :sales_person_email, length: { maximum: 255 }, allow_blank: true,
    # NOTE: サンプルのため、チェックをゆるめにしています。
    #       厳密なチェックが必要な場合は gem を使うのがおすすめです。
    #       https://www.ruby-toolbox.com/projects/email_validator
    #       (使い方も上記のページに載っています)
    format: { with: /\A[^@]+@[a-zA-Z0-9_.-]+\z/, message: :invalid_email_format }

  scope :matches, ->(client_search_form) {
    client_search_form.add_scopes(all)
  }

  private

  def to_utf8
    # NOTE: Kconv#toutf8(str) は半角カタカナを全角カタカナにします
    self.name = Kconv.toutf8(name) if name.present?
    self.abbr = Kconv.toutf8(abbr) if abbr.present?
    self.code = Kconv.toutf8(code) if code.present?
    self.full_name = Kconv.toutf8(full_name) if full_name.present?
    self.full_name_kana = Kconv.toutf8(full_name_kana) if full_name_kana.present?
    self.pref_name = Kconv.toutf8(pref_name) if pref_name.present?
    self.address_city = Kconv.toutf8(address_city) if address_city.present?
    self.address_extra = Kconv.toutf8(address_extra) if address_extra.present?
    self.sales_person_name = Kconv.toutf8(sales_person_name) if sales_person_name.present?
  end
end
