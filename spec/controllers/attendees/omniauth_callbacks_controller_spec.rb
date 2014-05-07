require 'spec_helper'

describe Attendees::OmniauthCallbacksController do
  describe '#twitter' do
    before do
      controller.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      controller.request.env['devise.mapping'] = Devise.mappings[:attendee]
    end

    def make_request
      post :twitter
    end

    context 'when an attendee exists with the uid' do
      let!(:attendee) { create(:scholar, provider: 'twitter', uid: '12345') }

      before { make_request }

      it 'assigns the attendee' do
        expect(assigns(:attendee)).to eq(attendee)
      end

      it 'redirects to the root url' do
        expect(response).to redirect_to(root_url)
      end
    end

    context 'when an attendee exists with the email' do
      let!(:attendee) { create(:scholar, email: 'shaven.yak@example.com') }

      it 'updates the uid on the attendee' do
        expect {
          make_request
        }.to change { attendee.reload.uid }.to('12345')
      end

      it 'updates the provider on the attendee' do
        expect {
          make_request
        }.to change { attendee.reload.provider }.to('twitter')
      end

      describe 'after the request is made' do
        before { make_request }

        it 'assigns the attendee' do
          expect(assigns(:attendee)).to eq(attendee)
        end

        it 'redirects to the root url' do
          expect(response).to redirect_to(root_url)
        end
      end
    end

    context 'when no attendee exists for the uid' do
      it 'creates an attendee' do
        expect {
          make_request
        }.not_to change(Attendee, :count)
      end

      describe 'after the request is made' do
        before { make_request }

        it 'redirects to the root url' do
          expect(response).to redirect_to(root_url)
        end

        it 'sets a flash message' do
          expect(flash[:alert]).to eq('You are not registered as a Scholar or Guide.')
        end
      end
    end
  end
end
