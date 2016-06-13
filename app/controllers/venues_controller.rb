class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end


  def create
    @venue = Venue.create(permitted_params)
    flash[:message] = @venue.valid? ? "Success" : "Failure"
    redirect_to '/'
  end

  def show
    puts "true"
    @venue = Venue.find(params['id'])
    puts @venue.name
  end

  def update
    collab = Collaboration.find(params[:id])
    collab.update(status: "collaborator")
    alter_notif = Notification.find(collab.notifications[0].id)
    notif_params = notification_params
    accepted_user = User.find(collab.user_id)
    notif_params[:user_id] = accepted_user.id
    project = Project.find(collab.project_id)
    alter_notif.update(description: "#{accepted_user.name}'s was accepted to collaborate on #{project.title}")
    notif_params[:project_id] = project.id
    notif_params[:relation] = "collaborator"
    notif_params[:description] = "You have been accepted to collaborate on #{project.title}!"
    collab
    collab.notifications.create(notif_params)
    redirect_to '/notifications'
  end

  def destroy
    collaboration = Collaboration.find(params[:id])
    project = Project.find(collaboration.project_id)
    project_creator = User.find(project.user_id)
    alter_notif = Notification.find(collaboration.notifications[0].id)
    rejected_user = User.find(collaboration.user_id)
    collaboration.destroy
    if @current_user == project_creator
      notif_params = notification_params
      notif_params[:user_id] = rejected_user.id
      notif_params[:project_id] = project.id
      notif_params[:description] = "You have been denied your request to collaborate on #{project.title}!"
      Notification.create(notif_params)
      alter_notif.update(description: "#{rejected_user.name}'s collaboration request was denied for #{project.title}.")
      redirect_to '/notifications'
    else
      notif_params = notification_params
      notif_params[:user_id] = project_creator.id
      Notification.create(notif_params)
      redirect_to project_path(project.id)
    end
  end

  private

  def permitted_params
    params.require(:venue).permit(:name, :address, :phone_number, :website_url, :neighborhood, :twitter_url, :facebook_url, :instagram_url, :email, :other)
  end

end



















