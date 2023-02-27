# frozen_string_literal: true

class List < ApplicationRecord
  validates :name, presence: true
end
