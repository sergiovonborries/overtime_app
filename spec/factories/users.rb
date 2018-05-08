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
    phone "59177632551"
  end

  factory :admin_user, class: "AdminUser" do
    email {generate :email}
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Admin"
    last_name "User"
    phone "59177632551"
  end

  factory :non_authorized_user, class: "User" do
    email {generate :email}
    password "asdfasdf"
    password_confirmation "asdfasdf"
    first_name "Non"
    last_name "Authorized"
    phone "59177632551"
  end
end
