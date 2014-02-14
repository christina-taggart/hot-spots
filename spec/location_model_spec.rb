require 'spec_helper'

describe Location do
  before :all do
    Location.delete_all
  end

  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :lattitude }
  it { should have_many :users }
  it { should have_many :location_users}

  subject { Location.new(name: 'paris', longitude: '32W', lattitude: '45N') }

  it 'will not save if longitude lattitude combination exists' do
    subject.save
    expect{Location.create(name: 'paris', longitude: '32W',
            lattitude: '45N')}.not_to change(LocationUser, :count).by(1)
    subject.destroy
  end
end
