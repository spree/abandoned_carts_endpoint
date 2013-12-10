Fabricator(:cart) do
  number            { sequence { |i| "R#{Random.rand(999999999)}" } }
  payload           { Factories.cart_new_payload }
  last_activity_at  { Time.now.utc }
end