class WordCountService
  def self.total_count(id:, message:, word_count_class: WordCount)
    value = message.to_s.split(' ').length

    word_count = word_count_class.new(request_id: id, value: value)
    if word_count.save
      word_count_class.sum(:value)
    end
  end
end