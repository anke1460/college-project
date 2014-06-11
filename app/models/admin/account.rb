class Admin::Account < ActiveRecord::Base
  include Account::Accountable

  default_scope { order('id desc') }
end
