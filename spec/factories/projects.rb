FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Test Project #{n}" }
    description { "Sample project for testing purposes" }
    due_on { 1.week.from_now }
    association :owner
   

    # メモ付のプロジェクト
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end 

    # 締め切りが機能
    trait :due_yesterday do
      due_on { 1.day.ago }
    end

    # しめきりが今日
    trait :due_today do
      due_on { Date.current.in_time_zone } 
    end

    #　締め切りが明日 
    trait :due_tomorrow do
      due_on { 1.day.from_now }
    end
  end
end
