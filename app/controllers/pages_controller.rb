class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :demo, :helpform ]

  def home
  end

  def setup
  end

  def demo
  end

  def user
    @users = User.all
  end

  def helpform
  end
end
