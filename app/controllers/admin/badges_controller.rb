class Admin::BadgesController < Admin::BaseController
    before_action :authenticate_user!
    before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
    @badge_assign = BadgeAssign.all
  end

  def show

  end

  def new
    @badge = Badge.new
  end

  def edit

  end

  def create
    @badge = Badge.new(badge_params)
    @badge.author = current_user
    if @badge.save
        redirect_to [:admin, @badge], notice: 'Badge was create successfuilly'
    else
        render :new
    end
  end

  def update
    if @badge.update(badge_params)
    redirect_to admin_badge_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private
    def badge_params
        params.require(:badge).permit(:title, :reward_link, :rule_id)
    end

    def find_badge
      @badge = Badge.find(params[:id])
    end

end
