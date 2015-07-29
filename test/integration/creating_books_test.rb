require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest

  test 'creates new books' do
    post '/books', {}, {}

    assert_equal 201, response.status
  end
end
