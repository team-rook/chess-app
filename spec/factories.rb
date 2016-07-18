FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@example.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
  end

  factory :game do
    association :white_user, factory: :user
    association :black_user, factory: :user
  end

  factory :piece do
    association :game
  end

  factory :pawn do

  end

  factory :rook do

  end

  factory :knight do

  end

  factory :bishop do

  end

  factory :king do

  end

  factory :queen do

  end
end
