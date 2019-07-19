class BadgesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
    @badge_assign = BadgeAssign.all
  end

end
