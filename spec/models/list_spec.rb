# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  context 'validates' do
    let(:list_a) { create(:list) }

    it 'when the name is present the list is valid' do
      expect(list_a).to be_valid
    end

    let(:list_b) { build(:list, name: nil) }

    it 'when the name is not present the list is invalid' do
      list_b.valid?
      expect(list_b.errors[:name]).to include("can't be blank")
    end
  end
end
