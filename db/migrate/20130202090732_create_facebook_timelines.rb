class CreateFacebookTimelines < ActiveRecord::Migration
  def change
    create_table :facebook_timelines do |t|

      t.timestamps
    end
  end
end
