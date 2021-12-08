require "rails_helper"

RSpec.describe "recipes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/recipes/#{recipe.id}"
  end

  describe "basic destroy" do
    let!(:recipe) { create(:recipe) }

    it "updates the resource" do
      expect(RecipeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Recipe.count }.by(-1)
      expect { recipe.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
