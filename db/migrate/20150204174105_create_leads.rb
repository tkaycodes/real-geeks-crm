class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.belongs_to :agent
      t.integer :search_count, default: 0
      t.string :last_search
      t.datetime :start_date
      t.datetime :active_at

      t.timestamps null: false
    end
  end
end
