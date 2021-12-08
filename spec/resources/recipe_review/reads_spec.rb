require "rails_helper"

RSpec.describe RecipeReviewResource, type: :resource do
  describe "serialization" do
    let!(:recipe_review) { create(:recipe_review) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(recipe_review.id)
      expect(data.jsonapi_type).to eq("recipe_reviews")
    end
  end

  describe "filtering" do
    let!(:recipe_review1) { create(:recipe_review) }
    let!(:recipe_review2) { create(:recipe_review) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: recipe_review2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([recipe_review2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:recipe_review1) { create(:recipe_review) }
      let!(:recipe_review2) { create(:recipe_review) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_review1.id,
                                      recipe_review2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      recipe_review2.id,
                                      recipe_review1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
