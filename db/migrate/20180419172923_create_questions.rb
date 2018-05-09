class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.belongs_to :student, index: true
      t.string :title
      t.text :content
      t.string :link 
      
      t.timestamps
    end
  end
end
