# == Schema Information
#
# Table name: urls
#
#  id            :integer          not null, primary key
#  link          :string(255)
#  random_string :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Url < ActiveRecord::Base

end
