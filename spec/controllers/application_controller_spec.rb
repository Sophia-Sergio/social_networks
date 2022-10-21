describe ApplicationController, type: :controller do
  describe '#root' do
    context 'successfull api call' do
      it 'returns all successfull social keys' do
        VCR.use_cassette("/social_networks_success") { get '/' }
        expect(json.keys).to match_array(%w[facebook twitter instagram])
      end
    end

    context 'when facebook fails' do
      it 'returns all successfull social keys' do
        VCR.use_cassette("/instagram_twitter_success") { get '/' }
        expect(json.keys).to match_array(%w[instagram twitter])
      end
    end

    context 'when twitter fails' do
      it 'returns all successfull social keys' do
        VCR.use_cassette("/facebook_instagram_success") { get '/' }
        expect(json.keys).to match_array(%w[instagram facebook])
      end
    end

    context 'when instagram fails' do
      it 'returns all successfull social keys' do
        VCR.use_cassette("/facebook_twitter_success") { get '/' }
        expect(json.keys).to match_array(%w[twitter facebook])
      end
    end

    context 'when all fail' do
      let(:error_message) { 'no social network available' }
      it 'returns error message' do
        VCR.use_cassette("/social_networks_fail") { get '/' }

        expect(json['error']).to eq(error_message)
      end
    end
  end
end
