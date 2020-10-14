# README

### Asumptions made regarding implementation

1. Since a REST API was requested, I setup a "WordCounts" resource and exposed
a POST method on it. However, it occurs to me that we are passing the attribute
`id`. Typically, when using a table backed resource, the `id` attribute refers to the id of the
record which is not passed in the create parameters but rather generated in the process of creating the record. Therefore, to satisfy the requirements and maintain conventions, I mapped this attribute to
another attribute on the actual record `request_id` and require it to be unique. I chose to use POST instead of
GET because a record is being created (in some cases) and the response is
mutating as a result. I suppose it could have been some kind of PUT or PATCH, since in someway it is mutating a single value that is returned. Not sure if it matters, but that is the reasoning I went with.
2. As implied by point 1, I decided to go ahead and use a relational database for
the persistence layer. It was not specified how long or under what circumstances
the 'reused' `id` attribute ought to be ignored. This could have been implemented
in other ways including some memory store, or redis or file storage. I opted for
the simplest implementation. Also, I assume that ignore means "don't send anything back in the json payload". It would be unusual to not respond to the request (literally ignoring it). So, I just send back an empty body. I suppose this could have been implemented in some way that inspected the request body and
applied some caching and filtering at the server layer. But again, given that it
was unclear I opted for the simplest solution.
3. A full blown Rails framework was not necessary to implement this task either.
However, it is simple enough to generate an app and add an enpoint and given that
there were no requirements or contraints around how this ought to be managed, again
I opted for the simplest implementation.
4. You will find that the business logic for the "counting" resides in
`app/services/word_count_service.rb`. There is also a controller that uses this
class and a model that is used by this class. There are specs in the spec directory
for all of these files. Instructions for running the specs are listed below.

### Setup and Testing
Ruby version: 2.6.2

System dependencies: SQLite

Database initialization

`bundle exec rake db:setup`

Running the test suite

`bundle exec rspec spec`

Starting the app

`bundle exec rails s`

If you are using postman for testing:

`./spec/test.postman_collection.json`
