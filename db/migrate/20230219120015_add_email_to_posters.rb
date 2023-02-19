class AddEmailToPosters < ActiveRecord::Migration[7.0]
  change_table :posters do |t|
    t.column :email, :string, limit: 128
  end
end
