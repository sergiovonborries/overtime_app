FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end
  factory :user do
    email {generate :email}
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Juan"
    last_name "Perez"
  end

  factory :admin_user, class: "AdminUser" do
    email {generate :email}
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Admin"
    last_name "User"
  end
end
