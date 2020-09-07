require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has a valid title" do 
    article = Article.new
    article.title = "Title"
    # byebug
    assert article.valid?
  end 

  test "empty title" do 
    article = Article.new
    article.title = ""
    assert_not article.valid?
  end 

  test "less than five letter title" do 
    article = Article.new
    article.title = "Dog"
    assert_not article.valid?
  end 

end