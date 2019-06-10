class PagesController < ApplicationController
  def home
  	@donations = Donation.all.shuffle[0..3]
  end
  def about
  end
end