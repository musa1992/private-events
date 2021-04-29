class AddEventDescriptionToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :string
    add_column :events, :description, :text
    add_column :events, :venue, :string
  end
end
