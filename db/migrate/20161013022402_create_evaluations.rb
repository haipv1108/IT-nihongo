class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
