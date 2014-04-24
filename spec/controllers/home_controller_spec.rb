require 'spec_helper'

describe HomeController do
  describe 'GET #index' do
    def make_request
      get :index
    end

    before { make_request }

    its(:response) { should be_success }
  end
end
