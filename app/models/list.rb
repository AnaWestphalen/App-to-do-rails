# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class List < ApplicationRecord
  has_many :tasks

  validates :name, presence: true
  validates_associated :tasks
end
