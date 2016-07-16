FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@example.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
  end

  factory :piece do
    factory :pawn do
      type "Pawn"
    end

    factory :rook do
      type "Rook"
    end

    factory :knight do
      type "Knight"
    end

    factory :bishop do
      type "Bishop"
    end

    factory :king do
      type "King"
    end

    factory :queen do
      type "Queen"
    end
  end
end
