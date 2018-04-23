class AddTagToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :lab, :string
  end
end
