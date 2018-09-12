class CreateAppNodesNodes < ActiveRecord::Migration[4.2]
  def change
    create_table :app_nodes_nodes do |t|
      t.string :address
      t.string :name
      t.string :version
      t.text :extended_info

      t.timestamps null: false
    end
  end
end
