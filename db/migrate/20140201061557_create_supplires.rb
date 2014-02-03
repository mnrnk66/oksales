class CreateSupplires < ActiveRecord::Migration
  def change
    create_table :supplires do |t|
      t.string :code, null: false       # 仕入先コード
      t.string :name, null: false       # 仕入先名
      t.string :short_name              # 仕入先名略称
      t.string :kana                    # 仕入先名カナ
      t.string :postal_code             # 郵便番号
      t.string :address1                # 住所1
      t.string :address2                # 住所2
      t.string :address3                # 住所3
      t.string :tel                     # 電話番号
      t.string :fax                     # FAX番号
      t.string :url                     # URL
      t.string :pic_name                # 担当者名
      t.string :pic_email               # 担当者Email
      t.decimal :price_ratio, :precision => 5, :scale => 2  # 単価掛率
      t.integer :create_user_id         # 登録ユーザーID
      t.integer :update_user_id         # 更新ユーザーID
      t.timestamp :deleted_at           # 削除日時    

      t.timestamps
    end
  end
end
