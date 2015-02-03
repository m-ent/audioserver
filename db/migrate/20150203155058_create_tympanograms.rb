class CreateTympanograms < ActiveRecord::Migration
  def change
    create_table :tympanograms do |t|
      t.references :patient, index: true
      t.references :examiner, index: true
      t.datetime :examdate
      t.string :comment
      t.string :image_location
      t.string :impedancemeter
      t.string :hospital
      t.float :rt_pvt
      t.float :rt_sc
      t.integer :rt_peak
      t.float :rt_interval
      t.text :rt_data
      t.integer :rt_data_length
      t.float :lt_pvt
      t.float :lt_sc
      t.integer :lt_peak
      t.float :lt_interval
      t.text :lt_data
      t.integer :lt_data_length

      t.timestamps
    end
  end
end
