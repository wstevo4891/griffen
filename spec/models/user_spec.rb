require "rails_helper"

RSpec.describe User do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :firstname }
    it { is_expected.to validate_presence_of :lastname }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :business }
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_confirmation_of :password }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
    it { is_expected.to have_one(:application).dependent(:destroy) }
    it { is_expected.to have_one(:ach).dependent(:destroy) }
    it { is_expected.to have_one(:document).dependent(:destroy) }
    it { is_expected.to have_many(:access_tokens).dependent(:destroy) }
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