require 'rails_helper'

describe Api::TodoListsController do
  render_views

  describe 'GET index' do
    let!(:todo_list) { TodoList.create(name: 'Setup RoR project') }

    context 'when format is HTML' do
      it 'raises a routing error' do
        expect {
          get :index
        }.to raise_error(ActionController::RoutingError, 'Not supported format')
      end
    end

    context 'when format is JSON' do
      it 'returns a success code' do
        get :index, format: :json

        expect(response.status).to eq(200)
      end

      it 'includes todo list records' do
        get :index, format: :json

        todo_lists = JSON.parse(response.body)

        aggregate_failures 'includes the id and name' do
          expect(todo_lists.count).to eq(1)
          expect(todo_lists[0].keys).to match_array(['id', 'name'])
          expect(todo_lists[0]['id']).to eq(todo_list.id)
          expect(todo_lists[0]['name']).to eq(todo_list.name)
        end
      end
    end
    context 'when creating a new todo list' do
      it 'creates a new todo list and returns it' do
        post :create, params: { todo_list: { name: 'New Todo List' } }, format: :json

        expect(response.status).to eq(201)
        todo_list = JSON.parse(response.body)

        expect(todo_list['name']).to eq('New Todo List')
      end

      it 'returns an error if the todo list is invalid' do
        post :create, params: { todo_list: { name: '' } }, format: :json

        expect(response.status).to eq(422)
        errors = JSON.parse(response.body)

        expect(errors['name']).to include("can't be blank")
      end
    end

    context 'when updating a todo list' do
      it 'updates the todo list and returns it' do
        todo_list = TodoList.create(name: 'Old Name')
        put :update, params: { id: todo_list.id, todo_list: { name: 'Updated Name' } }, format: :json

        expect(response.status).to eq(200)
        updated_todo_list = JSON.parse(response.body)

        expect(updated_todo_list['name']).to eq('Updated Name')
      end
    end

    context 'when deleting a todo list' do
      it 'deletes the todo list and returns no content' do
        todo_list = TodoList.create(name: 'To be deleted')
        delete :destroy, params: { id: todo_list.id }, format: :json

        expect(response.status).to eq(204)
        expect(TodoList.exists?(todo_list.id)).to be_falsey
      end

      it 'returns an error if the todo list does not exist' do
        delete :destroy, params: { id: 9999 }, format: :json

        expect(response.status).to eq(404)
        error = JSON.parse(response.body)

        expect(error['error']).to eq('Resource not found')
      end
    end
  end
end
