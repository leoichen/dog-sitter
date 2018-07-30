class AddDurationToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :duration, :integer
  end
end
