class ActionLog < ActiveColumn::Migration

  def self.up
    create_column_family :action_logs do |cf|
      cf.comment = 'Store user actions and platform events'
      cf.comparator_type = :string
      cf.column_type = 'Super' 
      cf.subcomparator_type = "TimeUUIDType"
    end
  end

  def self.down
    drop_column_family :action_logs
  end

end
