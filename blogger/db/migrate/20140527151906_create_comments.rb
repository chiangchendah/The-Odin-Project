class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      # it has an author
      t.string :author_name
      # it has a body
      t.text :body
      # it's attached to an article
      t.references :article, index: true

      t.timestamps
    end
  end
end
