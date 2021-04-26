FactoryBot.define do
  factory :want do
    id { 1 }
    title { '３ピースバンドベース募集' }
    text { 'こんにちは。寿限無寿限無五劫の擦り切れ海砂利水魚水行末雲雷末風来末食う寝る処に住む処etcetcetc' }
    
    association :user

  end
end
