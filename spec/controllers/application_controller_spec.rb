# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let(:user) { create(:user) }

  context '#after_sign_in_path_for' do
    it "redirects to the lists_path" do
      expect(subject.after_sign_in_path_for(user)).to eq(lists_path)
    end
  end
end
