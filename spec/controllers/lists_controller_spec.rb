# frozen_string_literal: true

require "rails_helper"

RSpec.describe ListsController, :type => :controller do
  context '#routes' do
    it 'get/index' do
      is_expected.to route(:get, '/lists').to(action: :index)
    end

    it 'get/show' do
      is_expected.to route(:get, '/lists/1').to(action: :show, id: 1)
    end

    it 'get/new' do
      is_expected.to route(:get, '/lists/new').to(action: :new)
    end

    it 'post/create' do
      is_expected.to route(:post, '/lists').to(action: :create)
    end

    it 'get/edit' do
      is_expected.to route(:get, '/lists/1/edit').to(action: :edit, id: 1)
    end

    it 'put/update' do
      is_expected.to route(:put, '/lists/1').to(action: :update, id: 1)
    end

    it 'delete/destroy' do
      is_expected.to route(:delete, '/lists/1').to(action: :destroy, id: 1)
    end
  end

  context '#show' do
    let(:list) { create(:list) }
    let(:list_params) { attributes_for(:list) }

    it 'when render a show template' do
      get :show, params: { id: list.id }
      expect(response).to render_template(:show)
    end
  end

  context '#create' do
    let(:list) { create(:list) }
    let(:list_params) { attributes_for(:list) }

    it 'when a list is created with valid attributes' do
      expect{
        post :create, params: { list: list_params }
      }.to change(List, :count).by(1)
    end

    let(:invalid_list) { attributes_for(:list, name:nil) }

    it 'when a list is created with valid attributes' do
      expect{
        post :create, params: { list: invalid_list }
      }.not_to change(List, :count)
    end

    it 'when a new list is created and a flash notice is sent' do
      post :create, params: { list: list_params }

      expect(flash[:notice]).to match(/criada com sucesso/)
    end
  end
end
