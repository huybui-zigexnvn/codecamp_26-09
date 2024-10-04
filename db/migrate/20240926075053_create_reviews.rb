class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :book
      t.references :user
      t.string :content

      t.timestamps
    end
  end
end
