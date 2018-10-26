require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the lists as complete' do
      list = List.create(name: "shopping")
      Task.create(complete: false, list_id: list.id, name: "Milk")
      Task.create(complete: false, list_id: list.id, name: "egg")

      list.complete_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end

    end
  end

  describe '#snooze_all_tasks!' do
    it 'should snooze all tasks from the list' do
      list = List.create(name: "shopping")
      Task.create(complete: false, list_id: list.id, name: "Milk")
      Task.create(comple: false, list_id: list.id, name: "egg")

      list.snooze_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
      
    end
  end

end
