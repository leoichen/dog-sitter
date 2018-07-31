class RemoveDurationFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :duration, :datetime
  end
end
