class AddCountriesToMovie < ActiveRecord::Migration[6.1]
  def change
    add_reference :movies, :country, null: false, foreign_key: true
  end
end
