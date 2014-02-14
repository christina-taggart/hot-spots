require 'spec_helper'

describe LocationUser do
  before :all do
    LocationUser.delete_all
  end

  it { should respond_to :has_visited }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :location_id }

  subject { LocationUser.new(user_id: 1, location_id: 2)}

  it 'should default to false on create' do
    subject.save
    expect(subject.has_visited).to be_false
    expect(subject.has_visited).not_to be_nil
    subject.destroy
  end

  it 'will not save if locaiton user combination exists' do
    subject.save
    expect{LocationUser.create(user_id: 1,
      location_id: 2)}.not_to change(LocationUser, :count).by(1)
  end
end
