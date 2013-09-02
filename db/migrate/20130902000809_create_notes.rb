class CreateNotes < ActiveRecord::Migration
  def change
  	create_table :notes do |n|
  		n.string :title
  		n.string :content
  		n.timestamps
  	end 
  end
end
