# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  status      :string
#  creator     :string
#  performer   :string
#  completed   :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true
  validates :creator, presence: true
  validates :completed, inclusion: [true, false]

  attribute :status, default: -> { 'new' }
end
