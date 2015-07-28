class AddFinishedAtToBooks < ActiveRecord::Migration
  def change
    add_column :books, :finished_at, :datetime
  end
end
