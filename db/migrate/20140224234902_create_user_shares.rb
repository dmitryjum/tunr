class CreateUserShares < ActiveRecord::Migration
  def change
    create_table :user_shares do |t|
      t.references :playlist
      t.references :user
    end
  end
end
