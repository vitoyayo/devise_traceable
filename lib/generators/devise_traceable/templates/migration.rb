class DeviseCreateUserTracings < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name.singularize %>_tracings do |t|
      t.integer  :<%= table_name.classify.foreign_key  %>
      t.datetime :sign_in_at
      t.datetime :sign_out_at
      t.string :sign_in_ip
      t.string :sign_out_ip
      t.string :user_agent
      t.string :device_type
      t.string :device_name
      t.timestamps
  end

  add_index :<%= table_name.singularize %>_tracings, :<%= table_name.classify.foreign_key  %>
end

def self.down
  drop_table :<%= table_name.singularize %>_tracings
end
end
