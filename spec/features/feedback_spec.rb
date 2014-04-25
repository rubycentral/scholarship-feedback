require 'spec_helper'

describe 'Leaving feedback' do
  let!(:scholar) { create(:scholar, name: 'Tourism is Cool') }
  let!(:guide) { create(:guide, scholar: scholar, name: 'Dogs') }

  context 'as a guide' do
    before { login_as guide }

    it 'lets the guide enter a comment' do
      visit root_path

      click_link 'Leave Feedback for Tourism is Cool'

      fill_in 'Your Story', with: 'this was great'
      fill_in 'Private Comments', with: "I didn't even see my scholar"
      click_button 'Create Feedback'

      expect(page).to have_content('Thanks for leaving your feedback!')
    end
  end

  context 'as a scholar' do
    let!(:other_guide) { create(:guide, scholar: scholar, name: 'Cats') }

    before { login_as scholar }

    it 'lets the scholar enter a comment' do
      visit root_path

      click_link 'Leave Feedback for Dogs and Cats'

      fill_in 'Your Story', with: 'i like both dogs and cats'
      fill_in 'Private Comments', with: 'i love pork'
      click_button 'Create Feedback'

      expect(page).to have_content('Thanks for leaving your feedback!')
    end
  end
end
