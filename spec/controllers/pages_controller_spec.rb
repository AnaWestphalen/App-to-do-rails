# frozen_string_literal: true

require "rails_helper"

RSpec.describe PagesController, type: :controller do
  describe 'controller actions' do
    context '#routes' do
      it 'get/home' do
        is_expected.to route(:get, '/').to(action: :home)
      end
    end
  end

  describe 'as a Guest' do
    context '#home' do
      it 'when returns a 200 response' do
        get :home
        expect(response).to have_http_status(200)
      end
    end
  end
end
