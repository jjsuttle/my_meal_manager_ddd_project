require 'rails_helper'

RSpec.describe RecipeReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'recipe_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RecipeReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { RecipeReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:recipe_review) { create(:recipe_review) }

    let(:payload) do
      {
        data: {
          id: recipe_review.id.to_s,
          type: 'recipe_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RecipeReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { recipe_review.reload.updated_at }
      # .and change { recipe_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:recipe_review) { create(:recipe_review) }

    let(:instance) do
      RecipeReviewResource.find(id: recipe_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { RecipeReview.count }.by(-1)
    end
  end
end
