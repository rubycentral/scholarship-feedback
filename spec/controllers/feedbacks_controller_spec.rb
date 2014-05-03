require 'spec_helper'

describe FeedbacksController do
  let(:scholar) { create(:scholar) }

  describe 'GET #new' do
    def make_request
      get :new
    end

    context 'when not signed in' do
      before do
        make_request
      end

      its(:response) { should redirect_to(new_attendee_session_path) }
    end

    context 'when signed in' do
      before do
        sign_in(scholar)
        make_request
      end

      its(:response) { should be_success }

      it 'assigns a new Feedback' do
        expect(assigns(:feedback)).to be
      end
    end
  end

  describe 'POST #create' do
    def make_request(params = {feedback: {testimonial: 'Great!', private_feedback: 'Actually sucks'}})
      post :create, params
    end

    context 'when not signed in' do
      before do
        make_request
      end

      its(:response) { should redirect_to(new_attendee_session_path) }
    end

    context 'when signed in' do
      before { sign_in(scholar) }

      context 'with invalid params' do
        it 'blows up' do
          expect {
            make_request(attendee_id: 0, feedback: {})
          }.to raise_error
        end
      end

      context 'when the attendee has already left feedback' do
        before { create(:feedback, attendee: scholar) }

        it 'does not create a new feedback' do
          expect {
            make_request
          }.not_to change(Feedback, :count)
        end

        context 'when making the request' do
          before { make_request }

          its(:response) { should redirect_to(root_path) }

          it 'sets the notice to a thank you message' do
            expect(flash[:notice]).to include('Thanks for leaving your feedback!')
          end
        end
      end

      context 'with valid params' do
        it 'creates a new feedback' do
          expect {
            make_request
          }.to change(Feedback, :count).by(1)
        end

        it 'creates a new feedback for the attendee' do
          expect{
            make_request
          }.to change { scholar.reload.feedback }.from(nil)
        end

        context 'when making the request' do
          before { make_request }

          its(:response) { should redirect_to(root_path) }

          it 'sets the notice to a thank you message' do
            expect(flash[:notice]).to include('Thanks for leaving your feedback!')
          end
        end
      end
    end
  end
end
