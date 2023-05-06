require "test_helper"

class ArticleTest < ActiveSupport::TestCase
 
  setup do 
    @article = Article.new
    @news_article = articles(:news_story)
    @sports_article = articles(:sports_story)
  end

  test "should save an article" do
    assert @article.save
  end

  test "should find an article" do
    @article.title = "Music Article"
    @article.published = false
    @article.save

    expected_article = Article.find(@article.id)
    assert_equal(expected_article.title, @article.title)
    assert_equal(expected_article.published, @article.published)
  end

  test "should delete an article" do
    @article.save
    assert_difference("Article.count", -1)do
      @article.destroy
    end
  end

  test "should update an article" do
    news_update_title = "Todays news update"
    @news_article.update({
      title: news_update_title
    })
    assert_equal(news_update_title,  @news_article.title)
  end

    test "should be published when true" do
      news_article = articles(:news_story)
      assert_equal(@news_article.get_article_status(), "Published")
    end

    test "should be not published when false" do
      assert_equal(@sports_article.get_article_status(), "Not Published")
    end
end
