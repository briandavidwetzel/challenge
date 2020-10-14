Rails.application.routes.draw do

  resource :word_counts, only: [:create], path: 'word-counts'

end
