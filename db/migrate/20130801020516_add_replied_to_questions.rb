class AddRepliedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :replied, :boolean, default: false
    add_index :questions, :replied
  end
end
