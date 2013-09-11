require 'spec_helper'

describe "OmniAuth::Strategies::Withings" do
  subject do
    OmniAuth::Strategies::Withings.new(nil, @options || {})
  end

  context 'client options' do
    it 'has correct OAuth endpoint' do
      subject.options.client_options.site.should eq('https://oauth.withings.com')
    end

    it 'has correct request token url' do
      subject.options.client_options.request_token_path.should eq('/account/request_token')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_path.should eq('/account/access_token')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/account/authorize')
    end
  end

  context 'uid' do
    before :each do
      access_token = double('access_token')
      access_token.stub('params') { { 'encoded_user_id' => '123ABC' } }
      subject.stub(:access_token) { access_token }
    end

    it 'returns the correct id from raw_info' do
      subject.uid.should eq('123ABC')
    end
  end

  context 'info' do
    before :each do
      subject.stub(:raw_info) { 
        { 
          "body" => {
            "users" => [
              { 
                "id"        => 1,
                "firstname" => "John", 
                "lastname"  => "Doe", 
                "shortname" => "JD", 
                "gender"    => 0,
                "birthdate" => 1379097185
              } 
            ]
          }
        } 
      }
    end

    it 'returns the correct id from raw_info' do
      subject.info[:id].should eq(1)
    end

    it 'returns the correct first name from raw_info' do
      subject.info[:firstname].should eq("John")
    end

    it 'returns the correct last name from raw_info' do
      subject.info[:lastname].should eq("Doe")
    end

    it 'returns the correct short name from raw_info' do
      subject.info[:shortname].should eq("JD")
    end

    it 'returns the correct birthdate from raw_info' do
      subject.info[:birthdate].should eq(Time.at(1379097185))
    end

    describe 'gender' do
      let(:male)   { 0 }
      let(:female) { 1 }

      def stub_gender(gender)
        subject.stub(:raw_info) {
          { 
            "body" => {
              "users" => [
                { 
                  "gender" => gender,
                }
              ]
            }
          }
        }
      end

      context 'when the gender is male' do
        it 'returns the correct gender from raw_info' do
          stub_gender male
          subject.info[:gender].should eq(:male)
        end
      end
    end

  end
end
