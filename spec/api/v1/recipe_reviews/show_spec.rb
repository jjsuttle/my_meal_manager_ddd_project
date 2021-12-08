require 'rails_helper'

RSpec.describe "recipe_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_reviews/#{recipe_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_review) { create(:recipe_review) }

    it 'works' do
      expect(RecipeReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('recipe_reviews')
      expect(d.id).to eq(recipe_review.id)
    end
  end
end
