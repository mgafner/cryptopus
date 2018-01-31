require 'test_helper'

class ItemPolicyTest < PolicyTest
  context '#show' do
    test 'teammember can show item' do
      require 'pry'; binding.pry
      assert_permit bob, item, :show?
    end

    test 'non teammember cannot show item' do
      refute_permit alice, item, :show?
    end
  end

  context '#new' do
    test 'teammember can create a new item' do
      assert_permit bob, item, :new?
    end

    test 'non teammember cannot create a new item' do
      refute_permit alice, item, :new?
    end
  end

  context '#create' do
    test 'teammember can create a new item with keypair' do
      assert_permit bob, account, :create_item?
    end

    test 'non teammember cannot create a new item with keypair' do
      refute_permit alice, account, :create_item?
    end
  end
  
  context '#destroy' do
    test 'teammember can destroy item' do
      assert_permit bob, item, :destroy?
    end

    test 'non teammember cannot destroy item' do
      refute_permit alice, item, :destroy?
    end
  end

  private
  
  def account
    Account.find_by(accountname: 'account2')
  end

  def item
    Fabricate(:item, account: account, team_password: 'password')
  end
end
