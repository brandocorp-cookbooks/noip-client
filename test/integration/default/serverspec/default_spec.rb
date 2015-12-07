require 'spec_helper'

describe 'noip-client::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe file('/usr/local/bin/noip2') do
    it { is_expected.to be_file }
  end
end
