require "rails_helper"

RSpec.describe RecipeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "recipes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RecipeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Recipe.count }.by(1)
    end
  end

  describe "updating" do
    let!(:recipe) { create(:recipe) }

    let(:payload) do
      {
        data: {
          id: recipe.id.to_s,
          type: "recipes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RecipeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { recipe.reload.updated_at }
      # .and change { recipe.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:recipe) { create(:recipe) }

    let(:instance) do
      RecipeResource.find(id: recipe.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Recipe.count }.by(-1)
    end
  end
end
