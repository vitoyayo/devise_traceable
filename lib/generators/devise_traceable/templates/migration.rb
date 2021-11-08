class DeviseCreateUserTracings < ActiveRecord::Migration[6.1]
  def self.up
    create_table :user_tracings do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.datetime :sign_in_at
      t.datetime :sign_out_at
      t.string :sign_in_ip
      t.string :sign_out_ip
      t.string :user_agent
      t.timestamps
  end

  add_index  :"#{table_name.singularize}_tracings", :"#{table_name.classify.foreign_key}"
end

def self.down
  drop_table : "#{table_name.singularize}_tracings"
end
end
