class ProductSearchForm
  include ActiveModel::Model

  attr_accessor :code, :name, :kana

  def add_scopes(scoped)
    scoped = scoped.where("code LIKE ?", "%#{code}%") if code.present?
    scoped = scoped.where("name LIKE ?", "%#{name}%") if name.present?
    scoped = scoped.where("kana LIKE ?", "%#{kana}%") if kana.present?
    scoped
  end
end
