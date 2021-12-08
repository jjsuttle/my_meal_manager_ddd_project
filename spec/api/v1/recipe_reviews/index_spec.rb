require 'rails_helper'

RSpec.describe "recipe_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/recipe_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:recipe_review1) { create(:recipe_review) }
    let!(:recipe_review2) { create(:recipe_review) }

    it 'works' do
      expect(RecipeReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['recipe_reviews'])
      expect(d.map(&:id)).to match_array([recipe_review1.id, recipe_review2.id])
    end
  end
end
