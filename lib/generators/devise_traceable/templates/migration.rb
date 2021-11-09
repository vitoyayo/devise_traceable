class DeviseCreateUserTracings < ActiveRecord::Migration[6.1]
  def self.up
    create_table :user_tracings do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.datetime :sign_in_at
      t.datetime :sign_out_at
      t.string :ip
      t.timestamps
  end

  add_index  :"#{table_name.singularize}_tracings", :"#{table_name.classify.foreign_key}"
end

def self.down
  drop_table : "#{table_name.singularize}_tracings"
end
end
