describe Admin::SortingService do

  describe "#next_sort_priority" do

    it "returns next int" do
      categories = [
        FactoryBot.create(:category, sort_priority: 0),
        FactoryBot.create(:category, sort_priority: 4)
      ]

      expect(Admin::SortingService.next_sort_priority(categories)).to eq(5)
    end

    it "handles nils" do
      categories = [
        FactoryBot.create(:category, sort_priority: 2),
        FactoryBot.create(:category, sort_priority: nil),
        FactoryBot.create(:category, sort_priority: 8)
      ]

      expect(Admin::SortingService.next_sort_priority(categories)).to eq(9)
    end

    it "handles empty array" do
      expect(Admin::SortingService.next_sort_priority([])).to eq(1)
    end

  end
end
