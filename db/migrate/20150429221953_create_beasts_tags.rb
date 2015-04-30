class CreateBeastsTags < ActiveRecord::Migration
  def change
    create_table :beasts_tags do |t|
      t.references :beast, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
