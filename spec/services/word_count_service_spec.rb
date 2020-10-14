require 'rails_helper'

describe WordCountService do
  let(:id) { 'some_id' }
  let(:message) { 'some message' }

  subject { described_class.new(id: id, message: message) }

end