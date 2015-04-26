class CreateMotivationalMessages < ActiveRecord::Migration
  def change
    create_table :motivational_messages do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
