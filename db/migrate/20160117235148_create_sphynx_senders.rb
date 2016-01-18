class CreateSphynxSenders < ActiveRecord::Migration
  def change
    create_table :sphynx_senders do |t|

      t.timestamps null: false
    end
  end
end
