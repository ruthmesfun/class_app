class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :question, index: true
      t.text :content
      t.integer :vote
      t.timestamps
    end
  end
end
