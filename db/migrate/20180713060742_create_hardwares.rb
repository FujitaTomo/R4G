class CreateHardwares < ActiveRecord::Migration[5.1]
  def change
    create_table :hardwares do |t|
      t.string :hardware

      t.timestamps
    end
  end
end
