require_relative '../../spec_helper'
describe Article do
  it 'can be initialized with attributes' do
    article = Article.new(title: 'Refactoring')
    article.title.must_equal 'Refactoring'
  end
end