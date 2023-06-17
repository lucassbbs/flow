class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :demo ]

  def home
  end

  def setup
  end

  def demo
  end
end
