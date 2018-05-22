class CreateTopicContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_contributions do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
    end
  end
end
