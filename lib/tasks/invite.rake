namespace :invite do
  task attendees: :environment do |t, args|
    Attendee.where(invitation_token: nil).each(&:invite!)
  end
end
