[
  {
      login: 'amtd',
      email: 'am@trinitydigital.ru'
  },
  {
      login: 'vbtd',
      email: 'vb@trinitydigital.ru'
  },
  {
      login: 'nrtd',
      email: 'nr@trinitydigital.ru'
  },
  {
      login: 'yatd',
      email: 'ya@trinitydigital.ru'
  }
].each do |user|
  User.where(login: user[:login]).first_or_create!(email: user[:email],
                                                   role_code: UserRole::Admin,
                                                   password: 'PassWord123')
end
