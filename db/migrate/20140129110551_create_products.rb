class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code, null: false      # 商品コード
      t.string :name, null: false      # 商品名
      t.string :short_name             # 商品名略称
      t.string :kana                   # 商品名カナ
      t.integer :product_group_id      # 商品区分ID
      t.decimal :price,       :precision => 15, :scale => 2  # 販売単価
      t.decimal :cost_price,  :precision => 15, :scale => 2  # 仕入単価
      t.integer :tax_type              # 課税区分
      t.integer :tax_class_id          # 消費税区分ID    
      t.string :district               # 産地
      t.integer :supplire_id           # 仕入先ID
      t.integer :unit_id               # 単位ID
      t.decimal :qty_per_box, :precision => 15, :scale => 2  # 入数
      t.integer :price_type            # 単価区分
      t.boolean :item_of_matrixlist    # マトリックス出力対象
      t.date :valid_from               # 適用開始日
      t.date :valid_until              # 適用終了日
      t.integer :create_user_id        # 登録ユーザーID
      t.integer :update_user_id        # 更新ユーザーID
      t.timestamp :deleted_at          # 削除日時     

      t.timestamps
    end
  end
end
