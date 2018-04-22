class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :student, index: true
      t.belongs_to :question, index: true
      t.string :title
      t.text :content
      t.integer :vote
      t.datetime :published_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
