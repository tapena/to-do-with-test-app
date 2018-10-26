require 'rails_helper'

RSpec.describe List, type: :model do
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the lists as complete' do
      list = List.create(name: "Shopping")
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
      Task.create(complete: false, list_id: list.id, name: "Milk", DateTime.now(11, 24, 2018))

      Task.create(complete: false, list_id: list.id, name: "egg", Datetime.now(11, 24, 2018))

      date = Datetime.now
      list.snooze_all_tasks!


      list.tasks.each do |task|
        expect(task.complete).to eq(Datetime.new(11, 24, 2018))
      end      
    end
  end

  describe '#incomplete_tasks!' do
    it 'should show all uncompleted tasks' do
      list = List.create(name: "shopping")
      Task.create(complete: true, list_id: list.id, name: "Milk")
      Task.create(complete: true, list_id: list.id, name: "Milk")
      Task.create(complete: false, list_id: list.id, name: "egg")

      list.incomplete_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(false)
      end      
    end
  end

end
