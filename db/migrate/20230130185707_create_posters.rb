class CreatePosters < ActiveRecord::Migration[7.0]
  def change
    create_table :posters do |t|
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
