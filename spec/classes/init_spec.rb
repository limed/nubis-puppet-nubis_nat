require 'spec_helper'
describe 'nubis_nat' do

  context 'with defaults for all parameters' do
    it { should contain_class('nubis_nat') }
  end
end
