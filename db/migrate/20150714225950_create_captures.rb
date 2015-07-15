class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.string :photo
      t.string :comment

      t.timestamps null: false
    end
  end
end
