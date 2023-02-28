# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:list) }
  end

  context 'validates' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:completed) }
    it { is_expected.to validate_presence_of(:list_id) }
  end
end
