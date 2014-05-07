OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
  provider: 'twitter',
  uid: '12345',
  info: {
    email: 'shaven.yak@example.com',
    name: 'Completely Shaved yak'
  }
)
