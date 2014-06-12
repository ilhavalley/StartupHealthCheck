require 'spec_helper'

describe StartupGenome::API do
  let(:sg) { StartupGenome::API.new }

  describe "#get_organizations" do
    it "sends a success response" do
      VCR.use_cassette 'startup_genome_api_get_organizations' do
        expect(sg.get_organizations.status).to eq(200) 
      end
    end
  end

  describe "#new_organization" do
    it "sends a success response" do
      organization = FactoryGirl.create(:organization, name: "Brewhouse", description: "Dedicated to building superb software. Our office is located in the heart of Vancouver's historic Gastown district. Stop by for a cup of coffee sometime.")
      puts "***********Organization: #{organization.inspect}"
      VCR.use_cassette 'startup_genome_api_new_organization' do
        response = sg.new_organization(organization)
        puts "***********Returned Response (from inside test): #{response.inspect}"
        expect(response.status).to eq(200) 
      end
    end
  end

  # describe "#update_organization" do
  #   it "sends a success response" do
  #     organization = FactoryGirl.create(:organizaton)

  #     organization.update(description: 'My new description')
  #     VCR.use_cassette 'startup_genome_api_update_organization' do
  #       expect(sg.update_organization(organization).status).to eq(200) 
  #     end
  #   end
  # end
end
