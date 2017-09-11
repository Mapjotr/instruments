FactoryGirl.define do

  factory :user do

    name  "Michael Example1"
    email  "michael@example.de"
    password_digest  { User.digest('password') }
    activated  true
    activated_at  { Time.zone.now }

    trait :admin do
      admin  true
    end

    trait :no_admin do
      admin  false
    end

  end
  
end