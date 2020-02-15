FactoryBot.define do
    factory :picture do
      img_link 'imglink.io'
      likes '10'
      liked false
      caption 'caption'
      created_by 'creator'
    end
  end