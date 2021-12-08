json.extract! recipe_review, :id, :reviewer_id, :recipe_id, :rating, :review,
              :recipe_name, :created_at, :updated_at
json.url recipe_review_url(recipe_review, format: :json)
