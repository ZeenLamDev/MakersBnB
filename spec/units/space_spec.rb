require './lib/space'
require 'database_helpers'

describe Space do

  describe '.create' do
    it 'creates a new space' do
      space = Space.create(
        name: "Test name",
        description: "Test description",
        date_available_from: "2021-01-01",
        date_available_to: "2021-01-02",
        price: "50"
        )

      Space.create(
        name: "Another name",
        description: "Another description",
        date_available_from: "2021-01-11",
        date_available_to: "2021-02-12",
        price: "50")

      persisted_data = persisted_data_retrieve(table: 'spaces', id: space.id)

      expect(space).to be_a Space
      expect(space.id).to eq persisted_data['id']
      expect(space.description).to eq 'Test description'
      expect(space.date_available_from).to eq '2021-01-01'
      expect(space.date_available_to).to eq '2021-01-02'
      expect(space.price).to eq "50"
    end
  end

  describe '.all' do
    it 'returns all listed spaces' do
      space = Space.create(
        name: "Test Name",
        description: "Test description",
        date_available_from: "2021-01-01",
        date_available_to: "2021-01-02",
        price: "50"
        )
      Space.create(
        name: "Lovely space",
        description: "Lovely description",
        date_available_from: "2021-03-03",
        date_available_to: "2021-01-04",
        price: "70")
      Space.create(
        name: "Delightful name",
        description: "Delightful description",
        date_available_from: "2021-01-14",
        date_available_to: "2021-01-15",
        price: "55")

      spaces = Space.all

      expect(spaces.length).to eq(3)
      expect(spaces.first).to be_a(Space)
      expect(spaces.first.id).to eq(space.id)
      expect(spaces.first.name).to eq('Test Name')
      expect(spaces.first.description).to eq('Test description')
      expect(spaces.first.price).to eq('50')

    end
  end

end