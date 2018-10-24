require 'features_helper'

describe 'Add an article' do
  after do
    ArticleRepository.new.clear
  end

  it 'can create a new article' do
    visit '/articles/new'

    within 'form#article-form' do
      fill_in 'Title',  with: 'New article'
      fill_in 'Content', with: 'Some content'
      fill_in 'Author', with: 'Some author'
      fill_in 'Category', with: 'Some category'

      click_button 'Create'
    end

    current_path.must_equal('/articles')
    assert page.has_content?('New article')
  end
end