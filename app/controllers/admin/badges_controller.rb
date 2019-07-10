class Admin::BadgesController < Admin::BaseController
    before_action :authenticate_user!
  

  def index
    
  end

  def show
    @badges = Badge.all
  end

  def new
    #@badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    binding.pry
    @badge.author = current_user
    binding.pry

    if @badge.save
        redirect_to [:admin, @badge], notice: 'Badge was create successfuilly'
    else
        render :new
    end
  end

  def destroy
    @badge.destroy
  end

  private
    def badge_params
        params.require(:badge).permit(:title, :reward_link, :rule_id)
    end

end
