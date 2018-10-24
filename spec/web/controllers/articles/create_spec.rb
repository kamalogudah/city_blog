require_relative '../../../spec_helper'

describe Web::Controllers::Articles::Create do
  let(:action) { Web::Controllers::Articles::Create.new }
  let(:params) { Hash[article: { title: 'Confident Ruby', content: 'Crazy book', author: 'Avdi Grimm', category: 'smart'}] }
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear
  end

  it 'creates a new article' do
    action.call(params)
    article = repository.last

    article.id.wont_be_nil
    article.title.must_equal params.dig(:article, :title)
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/articles'
  end
end