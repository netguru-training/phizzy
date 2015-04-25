class AddProfilableToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :profilable, polymorphic: true
    end
  end
end
