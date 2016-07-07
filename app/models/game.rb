class Game < ActiveRecord::Base
  belongs_to :white_user_id, :class_name => 'User'
  belongs_to :black_user_id, :class_name => 'User'
end
