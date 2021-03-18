class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :name,                null: false
      t.text        :description,         null: false
      t.integer     :price,               null: false
      t.integer     :shopping_charge_id,	null: false    
      t.integer     :shopping_area_id,	  null: false    
      t.integer     :shopping_date_id,	  null: false    
      t.integer     :category_id,	        null: false    
      t.integer     :status_id,	          null: false   
      t.references  :user,                null: false 



      
      t.timestamps
    end
  end
end
