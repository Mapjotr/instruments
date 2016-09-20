class StaticPagesController < ApplicationController
  def home
  	@test_variable = 'Peter'
  	@count = User.count
  	@users_name = User.select(:name)
  end

  def help
  end

  def contact
  end

  def about
  end

  def impressum
  end
end
