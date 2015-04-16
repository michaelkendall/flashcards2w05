class CreateFlashcards < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :answers
      t.text :text
    end
  end
end
