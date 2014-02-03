require 'kconv'

class Product < ActiveRecord::Base
	before_validation :to_utf8

  validates :code, presence: true, length: { maximum: 5 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :kana, length: { maximum: 255 }

  scope :matches, ->(product_search_form) {
    product_search_form.add_scopes(all)
  }

  private

  def to_utf8
    # NOTE: Kconv#toutf8(str) は半角カタカナを全角カタカナにします
    self.code = Kconv.toutf8(code) if code.present?
    self.name = Kconv.toutf8(name) if name.present?
    self.kana = Kconv.toutf8(kana) if kana.present?
    self.district= Kconv.toutf8(district) if district.present?
  end
end
