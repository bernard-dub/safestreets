class AddStatusToPosters < ActiveRecord::Migration[7.0]
  change_table :posters do |t|
    t.column :status, :string, limit: 128
  end
end
