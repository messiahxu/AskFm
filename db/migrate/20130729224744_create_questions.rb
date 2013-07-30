class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.references :user, index: true
      t.references :receiver, index: true

      t.timestamps
    end
  end
end
