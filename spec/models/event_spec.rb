RSpec.describe Event, type: :model do
  
  context 'Validation tests' do
    subject { Event.new }
    let(:create_event) { User.new(name: 'Samaila', username: 'Vashira') }
    it 'is valid with valid attributes' do
      subject.title = 'Birthday'
      subject.description = 'Anything description'
      subject.date = DateTime.now
      subject.creator = create_event
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.title = 'Birthday'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.title = 'Graduation'
      subject.description = 'Graduation ceremony'
      expect(subject).to_not be_valid
    end
  end

  context 'Association tests' do
    describe 'Event model associations' do
      it 'belongs to creator' do
        assc = Event.reflect_on_association(:creator)
        expect(assc.macro).to eq :belongs_to
      end
      it 'has many attendances' do
        assc = Event.reflect_on_association(:attendances)
        expect(assc.macro).to eq :has_many
      end
      it 'has many attendees' do
        assc = Event.reflect_on_association(:attendees)
        expect(assc.macro).to eq :has_many
      end
    end
  end
end  