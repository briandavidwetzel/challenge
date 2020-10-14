class WordCountsController < ApplicationController

  def create
    id = params.require(:id)
    message = params.require(:message)

    total_count = WordCountService.total_count(id: id, message: message)

    if total_count.present?
      render(
        json: {
          count: total_count
        },
        status: :created
      )
    else
      render :head
    end
  end

end
