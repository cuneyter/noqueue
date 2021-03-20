class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @stores = Store.all
    raise
    @store = Store.all.first # for navbar button "Queues" for demo purpose
  end
end
