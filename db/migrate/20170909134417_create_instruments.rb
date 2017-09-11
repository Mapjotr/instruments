class CreateInstruments < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments do |t|
      t.string      :name
      t.references  :user, foreign_key: true
      t.string      :abbrevation
      t.string      :size
      t.integer     :integer
      t.date        :purchase_date
      t.decimal     :price_per_month
      t.string      :seller
      t.text        :remark
      t.timestamps
    end
  end
end
