# == Schema Information
#
# Table name: goals
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  is_public   :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ApplicationRecord
  
  validates :title, :description, presence: true
  validates :is_public, presence: true
  
  belongs_to :user
  
  
  
end
