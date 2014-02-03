class ClientSearchForm
  include ActiveModel::Model

  attr_accessor :name, :full_name_kana, :code

  def add_scopes(scoped)
    scoped = scoped.where("name LIKE ?", "%#{name}%") if name.present?
    scoped = scoped.where("full_name_kana LIKE ?", "%#{full_name_kana}%") if full_name_kana.present?
    scoped = scoped.where("code LIKE ?", "%#{code}%") if code.present?
    scoped
  end
end
