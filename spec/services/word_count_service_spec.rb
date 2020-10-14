require 'rails_helper'

describe WordCountService do
  let(:word_count_class) { class_double(WordCount) }
  let(:id) { 'some_id' }
  let(:message) { 'some message' }
  let(:word_count) { instance_double(WordCount) }

  subject do
    described_class.total_count(
      id: id,
      message: message,
      word_count_class: word_count_class
    )
  end

  context 'when the request_id has not been taken' do
    let(:sum) { 'some_sum' }
    it 'creates a new word_count record' do
      expect(word_count_class).to receive(:new).with(
        request_id: id,
        value: 2
      ).and_return(word_count)
      expect(word_count).to receive(:save).and_return(true)
      expect(word_count_class).to receive(:sum).with(:value).and_return(sum)

      expect(subject).to eq(sum)
    end
  end

  context 'when the request_id has been taken' do
    it 'returns nil' do
      expect(word_count_class).to receive(:new).with(
        request_id: id,
        value: 2
      ).and_return(word_count)
      expect(word_count).to receive(:save).and_return(false)

      expect(subject).to eq(nil)
    end
  end

  context 'when message is not a string' do
    let(:sum) { 'some_sum' }

    context 'when the message is nil' do
      let(:message) { nil }
      it 'saves a value of 0' do
        expect(word_count_class).to receive(:new).with(
          request_id: id,
          value: 0
        ).and_return(word_count)
        expect(word_count).to receive(:save).and_return(true)
        expect(word_count_class).to receive(:sum).with(:value).and_return(sum)

        expect(subject).to eq(sum)
      end
    end

    context 'when the message is and integer' do
      let(:message) { 400 }
      it 'saves a value of 1' do
        expect(word_count_class).to receive(:new).with(
          request_id: id,
          value: 1
        ).and_return(word_count)
        expect(word_count).to receive(:save).and_return(true)
        expect(word_count_class).to receive(:sum).with(:value).and_return(sum)

        expect(subject).to eq(sum)
      end
    end
  end
end