class PagesController < ApplicationController
  def home
  	@donations = Donation.all.shuffle[0..4]
  end
  def about
  end
end