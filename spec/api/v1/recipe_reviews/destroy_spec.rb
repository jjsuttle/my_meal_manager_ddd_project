require "rails_helper"

RSpec.describe "recipe_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipe_reviews/#{recipe_review.id}"
  end

  describe "basic destroy" do
    let!(:recipe_review) { create(:recipe_review) }

    it "updates the resource" do
      expect(RecipeReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { RecipeReview.count }.by(-1)
      expect { recipe_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
