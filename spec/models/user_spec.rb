require "rails_helper"

RSpec.describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context '#issue_access_token' do
    it 'creates access token belonging to user' do
      user = create(:user)

      expect do
        access_token = user.issue_access_token
        expect(access_token).to be_persisted
        expect(access_token.user).to eq user
        expect(user.access_tokens).to eq [access_token]
      end.to change { AccessToken.count }.by(1)
    end
  end

end