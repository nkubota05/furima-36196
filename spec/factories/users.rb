FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    nickname {Faker::Name.name}
    family_name {Gimei::Name.last.kanji}
    first_name {Gimei::Name.first.kanji}
    family_name_kana {Gimei::Name.last.katakana}
    first_name_kana {Gimei::Name.first.katakana}
    birth_day {Faker::Date.birthday(min_age: 18, max_age: 65)}

  end
end