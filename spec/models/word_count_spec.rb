require 'rails_helper'

RSpec.describe WordCount, type: :model do
  context 'attributes' do
    describe :request_id do
      it 'is unique' do
        request_id = 'some_request_id'
        value = 2
        WordCount.create(request_id: request_id, value: value)

        word_count = WordCount.new(request_id: request_id, value: value)
        expect(word_count).to be_invalid
      end

      it 'is required' do
        request_id = nil
        value = 2
        word_count = WordCount.new(request_id: request_id, value: value)

        expect(word_count).to be_invalid
      end
    end

    describe :value do
      it 'is required' do
        request_id = 'some_request_id'
        value = nil
        word_count = WordCount.new(request_id: request_id, value: value)

        expect(word_count).to be_invalid
      end
    end
  end
end
