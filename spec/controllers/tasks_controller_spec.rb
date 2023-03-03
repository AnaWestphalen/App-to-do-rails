# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'task actions' do
    context '#routes' do
      it 'get/index' do
        is_expected.to route(:get, 'lists/1/tasks').to(action: :index, list_id: 1)
      end

      it 'get/show' do
        is_expected.to route(:get, 'lists/1/tasks/1').to(action: :show, id: 1, list_id: 1)
      end

      it 'get/new' do
        is_expected.to route(:get, 'lists/1/tasks/new').to(action: :new, list_id: 1)
      end

      it 'post/create' do
        is_expected.to route(:post, 'lists/1/tasks').to(action: :create, list_id: 1)
      end

      it 'get/edit' do
        is_expected.to route(:get, 'lists/1/tasks/1/edit').to(action: :edit, id: 1, list_id: 1)
      end

      it 'put/update' do
        is_expected.to route(:put, 'lists/1/tasks/1').to(action: :update, id: 1, list_id: 1)
      end

      it 'delete/destroy' do
        is_expected.to route(:delete, 'lists/1/tasks/1').to(action: :destroy, id: 1, list_id: 1)
      end
    end
  end

  describe 'as logged user' do
    let(:user) { create(:user) }
    let(:list) { create(:list) }
    let(:task) { create(:task) }
    let(:task_params) { attributes_for(:task) }
    let(:invalid_task) { attributes_for(:task, title: nil) }

    context '#index' do
      it 'when responds successfully' do
        sign_in user
        get :index, params: { list_id: list.id }
        expect(response).to be_successful
      end
    end

    # context '#show' do
    #   it 'when render a show template' do
    #     sign_in user

    #     get :show, params: { list_id: list.id, id: task.id }
    #     expect(response).to render_template(:show)
    #   end
    # end

    # context '#create' do
    #   it 'when a task is created with valid attributes' do
    #     sign_in user
    #     expect{
    #       post :create, params: { list_id: list.id, id: task.id, task: task_params }
    #     }.to change(List, :count).by(1)
    #   end

    #   it 'when a task is created with invalid attributes' do
    #     sign_in user
    #     expect{
    #       post :create, params: { list_id: list.id, id: task.id, task: invalid_task }
    #     }.not_to change(List, :count)
    #   end

    #   it 'when a new task is created and a flash notice is sent' do
    #     sign_in user
    #     post :create, params: { list_id: list.id, id: task.id, task: task_params }

    #     expect(flash[:notice]).to match(/criada com sucesso/)
    #   end
    # end

    # context '#update' do
    #   it 'when a task is updated with valid attributes' do
    #     sign_in user

    #     put :update, params: { list_id: list.id, id: task.id, task: task_params }
    #     expect(response).to be_redirect
    #   end

    #   it 'when a task is updated with invalid attributes' do
    #     sign_in user
    #     put :update, params: { list_id: list.id, id: task.id, task: invalid_task }
    #     expect(response).not_to be_redirect
    #   end

    #   it 'when a list is updated and a flash notice is sent' do
    #     sign_in user
    #     put :update, params: { list_id: list.id, id: task.id, task: task_params }

    #     expect(flash[:notice]).to match(/editada com sucesso/)
    #   end
    # end

    # context '#destroy' do
    #   it 'when a list is destroyed' do
    #     sign_in user
    #     delete :destroy, params: { list_id: list.id, id: task.id }
    #     expect(response).to be_redirect
    #   end

    #   it 'when a list is destroyed and a flash notice is sent' do
    #     sign_in user
    #     delete :destroy, params: { list_id: list.id, id: task.id }

    #     expect(flash[:notice]).to match(/deletada com sucesso/)
    #   end
    # end
  end
end
