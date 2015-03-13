class AddColumnToLead < ActiveRecord::Migration
  def change
    add_column :leads, :activity_log, :text
  end
end
