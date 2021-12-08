require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:recipe) }

    it { should belong_to(:food) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
