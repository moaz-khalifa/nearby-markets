class CreateSpreeMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_markets do |t|
      t.string :name
      t.text :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
    add_index :spree_markets, [:latitude, :longitude]
  end
end
