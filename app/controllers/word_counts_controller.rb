class WordCountsController < ApplicationController

  def create
    id = params.require(:id)
    message = params.require(:message)

    word_count_service = WordCountService.new(id: id, message: message)
    count = word_count_service.count

    if count.present?
      render(
        json: {
          count: count
        },
        status: :created
      )
    else
      render :head
    end
  end

end
