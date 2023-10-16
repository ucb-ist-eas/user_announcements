class Admin::AnnouncementsController < ApplicationController

  before_action :ensure_admin_user
  before_action :find_announcement, :only => [:edit, :update, :destroy]

  def index
    @announcements = AnnouncementFinder.for_admin
  end

  def new
    @announcement = Announcement.new_with_defaults
  end

  def edit
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to admin_announcements_path, :flash => { notice: 'Announcement created'}
    else
      render "new"
    end
  end

  def update
    @announcement.attributes = announcement_params
    @announcement.roles = [] unless announcement_params.has_key?(:roles)
    if @announcement.save
      redirect_to admin_announcements_path, :flash => { notice: 'Announcement updated' }
    else
      render "edit"
    end
  end

  def destroy
    @announcement.destroy
    redirect_to admin_announcements_path, :flash => { notice: 'Announcement deleted' }
  end

  private

  def find_announcement
    @announcement = Announcement.find(params.fetch(:id))
  end

  def announcement_params
    params.require(:announcement).permit(
     :active,
     :message,
     :starts_at,
     :ends_at,
     :style,
     {:roles => []},
     :type,
    )
  end
end
