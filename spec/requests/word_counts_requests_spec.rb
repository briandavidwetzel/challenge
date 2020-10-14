require 'rails_helper'

RSpec.describe WordCountsController do
  describe 'POST /word-counts' do
    let(:params) do
      {
        id: id,
        message: message
      }
    end
    let(:id) { 'some_id' }
    let(:message) { 'some_message' }

    context 'when the id has been sent before' do
      let(:word_count_service) { instance_double(WordCountService) }
      let(:total_count) { nil }

      let(:expected_response) do
        ' '
      end

      it 'renders the count calculated by the WordCountService' do
        expect(WordCountService).to receive(:total_count).with(
          id: id,
          message: message
        ).and_return(total_count)

        post(word_counts_path, params: params)

        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_response)
      end
    end

    context 'when the id has not been sent before' do
      let(:word_count_service) { instance_double(WordCountService) }
      let(:total_count) { 'some_count' }

      let(:expected_response) do
        {
          count: total_count
        }
      end

      it 'renders the count calculated by the WordCountService' do
        expect(WordCountService).to receive(:total_count).with(
          id: id,
          message: message
        ).and_return(total_count)

        post(word_counts_path, params: params)

        expect(response.status).to eq(201)
        expect(JSON.parse(response.body).deep_symbolize_keys).to eq(expected_response)
      end
    end

  end
end
