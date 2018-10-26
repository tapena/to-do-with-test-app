require 'rails_helper'

RSpec.describe Task, type: :model do
 describe '#toggle_complete!' do
  it 'should switch complete to false if it began as true' do
    task = Task.create(complete: true)
    task.toggle_complete!
    expect(task.complete).to eq(false)
  end

  it 'should switch complete to true if it began as false' do
    task = Task.create(complete: false)
    task.toggle_complete!
    expect(task.complete).to eq(true)
  end
 end

  describe '#toggle_favorite!' do
    it 'should switch task to favorite if it began as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
      it 'should switch task to favorite if it began as false' do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe '#overdue?' do
    it 'should return overdue tasks' do
      task = Task.create(overdue: 1.day.ago )
      expect(task.overdue?).to eq(true)
    end
    it 'should retrun false if deadline'
  end

  describe 'snooze_hour!' do
    it 'should push deadline back by one hour' do
      time = Time.now
      task = Task.create(deadline: time)
      task.snooze_hour!
      expect(task.deadline).to eq(time + 1.hour)
    end
  end

  describe '#increment_priority!' do
    it 'should increase the priority by 1' do
      task = Task.create(priority: 5)
      task.increment_priority!
      expect(task.priority).to uq(6)
      task.increment_priority!
      expect(task.priority).to eq(7)
    end
    it 'should not increment priority past 10' do
      task = Task.create(priority: 9)
      task.increment_priority!
      expect(task.priority).to eq(10)
      task.increment_priority!
      expect(task.priority).to eq(10)
    end
  end

end
