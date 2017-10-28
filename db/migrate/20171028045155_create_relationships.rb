class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :leader
      t.references :follower
      t.timestamps
    end
  end
end
