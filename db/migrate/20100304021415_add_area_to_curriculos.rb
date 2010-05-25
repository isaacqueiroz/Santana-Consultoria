class AddAreaToCurriculos < ActiveRecord::Migration
  def self.up
    remove_column :curriculos, :area_id
    remove_column :curriculos, :sub_area_id
    add_column :curriculos, :area_id1, :integer
    add_column :curriculos, :area_id2, :integer
    add_column :curriculos, :area_id3, :integer
  end

  def self.down
    add_column :curriculos, :area_id
    add_column :curriculos, :sub_area_id
    remove_column :curriculos, :area_id1
    remove_column :curriculos, :area_id2
    remove_column :curriculos, :area_id3
  end
end
