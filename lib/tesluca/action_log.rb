class ActionLog < ActiveColumn::Base
  key :action_type
  attr_accessor :action_type
end
