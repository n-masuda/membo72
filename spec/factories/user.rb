FactoryBot.define do
  factory :user do
    id { 1 }
    nickname { 'fgfg1234' }
    email { 'fgfg1234@pypy.com' }
    password { 'test1234TEST' }
    password_confirmation { password }
    prefecture_id { '22' }
    area { '首都圏' }
    age { '25' }
    part { 'ギター' }
    my_hero { '東京６０watts' }
  end
end
