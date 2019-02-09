# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ApplicationRecord

  belongs_to :user

  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :title, :description, presence:true

end
