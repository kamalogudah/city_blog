require 'features_helper'

describe 'List articles' do
  let(:repository) { ArticleRepository.new }
  before do
    repository.clear

    repository.create(title: 'PoEAA', content: 'yada yada', author: 'Martin Fowler', category: 'testiong')
    repository.create(title: 'TDD',  content: 'yada yada', author: 'Kent Beck', category: 'not testing')
  end

  it 'displays each article on the page' do
    
    visit '/articles'

    within '#articles' do
      assert page.has_css?('.article', count: 2), 'Expected to find 2 articles'
    end
  end
end