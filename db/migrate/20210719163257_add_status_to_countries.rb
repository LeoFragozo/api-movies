class AddStatusToCountries < ActiveRecord::Migration[6.1]
  def change
    add_column :countries, :status, :boolean, default: true
  end
end
