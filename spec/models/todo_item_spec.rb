require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  describe "factory" do
    it "is valid" do
      expect(build(:todo_item)).to be_valid
    end
  end

  describe "validations" do
    subject { create(:todo_item) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:todo_list_id) }
  end

  describe "associations" do
    it { should belong_to(:todo_list) }
  end
end
