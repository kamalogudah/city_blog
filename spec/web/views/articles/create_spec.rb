require_relative '../../../spec_helper'

describe Web::Views::Articles::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/articles/create.html.erb') }
  let(:view)      { Web::Views::Articles::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end
