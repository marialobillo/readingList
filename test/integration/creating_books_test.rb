require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'creates new books with valid data' do
    post '/books', { book: {
        title: 'Pragmatic Programmer',
        rating: 5
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    book = json(response.body)
    assert_equal book_url(book[:id]), response.location

    assert_equal 'Pragmatic Programmer', book[:title]
    assert_equal 5, book[:rating].to_i
  end

  test 'does not create books with invalid data' do
    post '/books', { book: {
        title: nil,
        rating: 5
      } }.to_json,
      { 'Accept' => 'application/json',
        'Content-Type' => 'application/json'}

    assert_equal 422, response.status
    
  end
end
