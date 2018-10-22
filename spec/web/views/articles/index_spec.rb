require_relative '../../../spec_helper'

describe Web::Views::Articles::Index do
  let(:exposures) { Hash[articles: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/articles/index.html.erb') }
  let(:view)      { Web::Views::Articles::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #articles' do
    view.articles.must_equal exposures.fetch(:articles)

  end

  describe 'when there are no articles' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no articles yet.</p>')
    end
  end

  describe 'when there are articles' do
    let(:article1)     { Article.new(title: 'Refactoring', author: 'Martin Fowler', content: 'Yes', category: 'crime') }
    let(:article2)     { Article.new(title: 'Domain Driven Design', author: 'Eric Evans', content: 'Yes No', category: ' more crime') }
    let(:exposures) { Hash[articles: [article1, article2]] }

    it 'lists them all' do
      rendered.scan(/class="article"/).count.must_equal 2
      rendered.must_include('Refactoring')
      rendered.must_include('Domain Driven Design')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no articles yet.</p>')
    end
  end
end