require "spec_helper"

describe AnalyticService::PersonAttributes do
  let(:community) { FactoryBot.create(:community) }
  let(:person) do
    person = FactoryBot.create(:person, community: community)
    FactoryBot.create(:community_membership, community: community, person: person, admin: true)
    person
  end

  context "#attributes" do
    it 'not configured community, person' do
      a = AnalyticService::PersonAttributes.new(person: person, community_id: community.id).attributes
      expect(a['info_marketplace_ident']).to eq community.ident
    end
  end
end
