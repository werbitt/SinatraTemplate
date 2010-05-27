require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  
  specify 'should show the default index page' do
    get '/'
    last_response.should be_ok
  end
  
end