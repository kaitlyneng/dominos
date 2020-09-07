require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do 
    get articles_url
    assert_response :success
  end 

  test "should create ARTICLES" do
    assert_difference('Article.count') do 
        post articles_url, params: { article: {text: 'Rails is rails', title: "hello Rails"}}
    end

    assert_redirected_to article_path(Article.last)
  end 

  test "does not create Article" do
    assert_no_difference('Article.count') do
        post articles_url, params: { article: {body: 'potato', title: 'sad' }}
    end
    assert_select 'h1', 'New Article'
  end

  test "should show articles" do 
    article = Article.create(title: 'hello', text: 'world')
    get article_path(Article.last)
    assert_response :success
  end

  test "should destroy article" do 
    article = Article.create(title: 'hello', text: 'world')
    assert_difference('Article.count', -1) do
        delete article_path(article.id)
    end
  end 

  test "should update article" do
    article = Article.create(title: 'hello', text: 'world')
    patch article_path(article.id), params: { article: {text: 'potato', title: 'happy'}}
    article.reload
    assert_equal 'potato', article.text
    assert_equal 'happy', article.title
    assert_redirected_to article_path(article)
  end

  test "should not update article" do
    article = Article.create(title: 'hello', text: 'world')
    patch article_path(article.id), params: { article: {text: 'potato', title: 'sad'}}
    article.reload
    assert_equal 'world', article.text
    assert_equal 'hello', article.title
    assert_response :success
    assert_select 'h1', 'Edit Article'
  end

end
