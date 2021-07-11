class AddActorsToMovie < ActiveRecord::Migration[6.1]
  def change
    add_reference :movies, :actor, null: false, foreign_key: true
  end
end
