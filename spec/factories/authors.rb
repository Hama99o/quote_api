FactoryBot.define do
  factory :author do
    sequence :name do |n|
      "Billy Graham#{n}"
    end
  end
end
