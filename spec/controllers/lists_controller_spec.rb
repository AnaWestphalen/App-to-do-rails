# frozen_string_literal: true

require "rails_helper"

RSpec.describe ListsController, type: :controller do
  describe 'controller actions' do
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
  end

  describe 'as logged user' do
    let(:user) { create(:user) }
    let(:list) { create(:list) }
    let(:list_params) { attributes_for(:list) }
    let(:invalid_list) { attributes_for(:list, name:nil) }

    context '#index' do
      it 'when responds successfully' do
        sign_in user
        get :index, params: { user_id: user.id }
        expect(response).to be_successful
      end

      it 'when returns a 302 response (not authorized)' do
        get :index
        expect(response).to have_http_status(302)
      end
    end

    context '#show' do
      it 'when render a show template' do
        sign_in user

        get :show, params: { id: list.id }
        expect(response).to render_template(:show)
      end
    end

    context '#create' do
      it 'when a list is created with valid attributes' do
        sign_in user
        expect{
          post :create, params: { list: list_params }
        }.to change(List, :count).by(1)
      end

      it 'when a list is created with invalid attributes' do
        sign_in user
        expect{
          post :create, params: { list: invalid_list }
        }.not_to change(List, :count)
      end

      it 'when a new list is created and a flash notice is sent' do
        sign_in user
        post :create, params: { list: list_params }

        expect(flash[:notice]).to match(/criada com sucesso/)
      end
    end

    context '#update' do
      it 'when a list is updated with valid attributes' do
        sign_in user

        put :update, params: { id: list.id, list: list_params }
        expect(response).to be_redirect
      end

      it 'when a list is updated with invalid attributes' do
        sign_in user
        put :update, params: { id: list.id, list: invalid_list }
        expect(response).not_to be_redirect
      end

      it 'when a list is updated and a flash notice is sent' do
        sign_in user
        put :update, params: { id: list.id, list: list_params }

        expect(flash[:notice]).to match(/editada com sucesso/)
      end
    end

    context '#destroy' do
      it 'when a list is destroyed' do
        sign_in user
        delete :destroy, params: { id: list.id }
        expect(response).to be_redirect
      end

      it 'when a list is destroyed and a flash notice is sent' do
        sign_in user
        delete :destroy, params: { id: list.id }

        expect(flash[:notice]).to match(/deletada com sucesso/)
      end
    end
  end
end
