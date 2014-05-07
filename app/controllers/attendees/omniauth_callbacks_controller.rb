class Attendees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  class AttendeeFinder < Struct.new(:provider, :uid, :email)
    def self.from_omniauth(omniauth_hash)
      new(omniauth_hash[:provider], omniauth_hash[:uid], omniauth_hash.info.email)
    end

    def find
      by_omniauth || from_email
    end

    private

    def by_omniauth
      Attendee.find_by(provider: provider, uid: uid)
    end

    def from_email
      attendee = Attendee.find_by(email: email)
      attendee.update_attributes(provider: provider, uid: uid) if attendee.present?
      attendee
    end
  end

  def twitter
    @attendee = AttendeeFinder.from_omniauth(request.env['omniauth.auth']).find
    if @attendee.present?
      sign_in_and_redirect(@attendee, event: :authentication)
    else
      redirect_to(root_url, alert: 'You are not registered as a Scholar or Guide.')
    end
  end
end
