require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe "factory" do
    it "is valid" do
      todo_list = build(:todo_list)
      expect(todo_list).to be_valid
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:todo_items).dependent(:destroy) }
  end

  describe '#complete_all' do
    it 'marks all associated todo_items as completed' do
      todo_list = create(:todo_list)
      create_list(:todo_item, 3, todo_list: todo_list, completed: false)

      todo_list.complete_all
      expect(todo_list.todo_items.pluck(:completed).uniq).to eq([true])
    end
  end

  describe '#clear_completed' do
    it 'removes all completed todo_items' do
      todo_list = create(:todo_list)
      create(:todo_item, todo_list: todo_list, completed: true)
      create(:todo_item, todo_list: todo_list, completed: false)

      expect {
        todo_list.clear_completed
      }.to change { todo_list.todo_items.count }.by(-1)

      expect(todo_list.todo_items.pluck(:completed)).to eq([false])
    end
  end
end
