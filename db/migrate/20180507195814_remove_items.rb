class RemoveItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :password_digest, :string
  end
end
