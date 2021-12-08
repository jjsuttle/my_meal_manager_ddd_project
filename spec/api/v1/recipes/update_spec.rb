require "rails_helper"

RSpec.describe "recipes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/recipes/#{recipe.id}", payload
  end

  describe "basic update" do
    let!(:recipe) { create(:recipe) }

    let(:payload) do
      {
        data: {
          id: recipe.id.to_s,
          type: "recipes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RecipeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { recipe.reload.attributes }
    end
  end
end
