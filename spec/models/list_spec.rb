# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:tasks) }
  end

  context 'validates' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'when task is present' do
    let(:list) { create(:list) }
    let(:task) { create(:task) }

    it 'and is valid, the list will also be valid' do
      expect(list).to be_valid
    end
  end

  context 'when task is present but not is valid, the list is invalid' do
    it { is_expected.not_to be_valid(:list) }
  end
end
