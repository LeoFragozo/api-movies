class AddToCountryToActors < ActiveRecord::Migration[6.1]
  def change
    add_reference :actors, :country, null: false, foreign_key: true
  end
end
