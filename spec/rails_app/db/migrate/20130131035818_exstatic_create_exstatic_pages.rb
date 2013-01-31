class ExstaticCreateExstaticPages < ActiveRecord::Migration
  def change
    create_table(:exstatic_pages) do |t|
      t.string :title
      t.text :content
      t.string :slug

      t.timestamps
    end
  end
end
