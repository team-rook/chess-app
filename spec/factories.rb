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

  factory :black_pawn, :class => Pawn, :parent => :piece do
    type "Pawn"
    user :black_user
  end

  factory :black_rook, :class => Rook, :parent => :piece do
    type "Rook"
    user :black_user
  end

  factory :black_knight, :class => Knight, :parent => :piece do
    type "Knight"
    user :black_user
  end

  factory :black_bishop, :class => Bishop, :parent => :piece do
    type "Bishop"
    user :black_user
  end

  factory :black_king, :class => King, :parent => :piece do
    type "King"
    user :black_user
  end

  factory :black_queen, :class => Queen, :parent => :piece do
    type "Queen"
    user :black_user
  end

  factory :white_pawn, :class => Pawn, :parent => :piece do
    type "Pawn"
    user :white_user
  end

  factory :white_rook, :class => Rook, :parent => :piece do
    type "Rook"
    user :white_user
  end

  factory :white_knight, :class => Knight, :parent => :piece do
    type "Knight"
    user :white_user
  end

  factory :white_bishop, :class => Bishop, :parent => :piece do
    type "Bishop"
    user :white_user
  end

  factory :white_king, :class => King, :parent => :piece do
    type "King"
    user :white_user
  end

  factory :white_queen, :class => Queen, :parent => :piece do
    type "Queen"
    user :white_user
  end
end
