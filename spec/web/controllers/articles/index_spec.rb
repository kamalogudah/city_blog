require_relative '../../../spec_helper'

describe Web::Controllers::Articles::Index do
  let(:action) { Web::Controllers::Articles::Index.new }
  let(:params) { Hash[] }
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear

    @article = repository.create(title: 'TDD',  content: 'yada yada', author: 'Kent Beck', category: 'not testing')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all books' do
    action.call(params)
    action.exposures[:articles].must_equal [@article]
  end
end