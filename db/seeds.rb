

7.times do |n|
    Food.create!(
       meal: "",
       amount: 0,
       food_name: "",
       quantity: 0,
       date: n.to_s
    )
end