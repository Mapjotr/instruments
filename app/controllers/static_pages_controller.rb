class StaticPagesController < ApplicationController
  def home
  	@test_variable = 'Peter'
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
