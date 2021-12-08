require "rails_helper"

RSpec.describe "recipe_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipe_reviews/#{recipe_review.id}", payload
  end

  describe "basic update" do
    let!(:recipe_review) { create(:recipe_review) }

    let(:payload) do
      {
        data: {
          id: recipe_review.id.to_s,
          type: "recipe_reviews",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RecipeReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { recipe_review.reload.attributes }
    end
  end
end
