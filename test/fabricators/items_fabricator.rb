# encoding: utf-8

#  Copyright (c) 2008-2017, Puzzle ITC GmbH. This file is part of
#  Cryptopus and licensed under the Affero General Public License version 3 or later.
#  See the COPYING file at the top-level directory or at
#  https://github.com/puzzle/cryptopus.

Fabricator(:team_1_item, from: :item) do
 transient :team_password
 account_id {1} 
 file { Faker::Cat.name }
 filename { Faker::Cat.name }
 content_type :text
 before_save do |item, attrs|
   item.encrypt(attrs[:team_password])
 end
end

Fabricator(:team_2_item, from: :item) do
 transient :team_password
 account_id {2} 
 file { Faker::Cat.name }
 filename { Faker::Cat.name }
 content_type :text
 before_save do |item, attrs|
   item.encrypt(attrs[:team_password])
 end
end
