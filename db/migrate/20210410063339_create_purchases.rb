class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user,	       null: false    
      t.references :product,	   null: false  
      t.timestamps
    end
  end
end
