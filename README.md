`bin/rails generate model User wechat_openid:string phone:string air_auth_token:string`


## UUID

```ruby
create_table :users, **id: :uuid** do |t|
```
```ruby
t.references :user, **type: :uuid**, foreign_key: true
```
