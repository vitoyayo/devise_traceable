= devise_traceable for users

>> rails g devise_traceable User

in User Model add :traceable as follow

` class User < ActiveRecord::Base`

`devise :database_authenticatable,:traceable `

` end`
