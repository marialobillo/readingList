require 'test_helper'

class ListingFinishedBooksTest < ActionDispatch::IntegrationTest

  setup do
    Book.create!(title: 'Finished', finished_at: 1.day.ago)
    Book.create!(title: 'Not Finished', finished_at: nil)
  end

  test 'lists finished books in JSON' do
    get '/finished_books', {}, {'Accept' => 'application/json'}

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body).size
  end

  test 'lists finished books in XML' do
    get '/finished_books', {}, {'Accept' => 'application/xml'}

    assert_equal 200, response.status
    assert_equal Mime::XML, response.content_type
    assert_equal 1, Hash.from_xml(response.body)['books'].size
  end
end
