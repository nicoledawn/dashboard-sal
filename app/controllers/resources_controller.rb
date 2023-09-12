class ResourcesController < ApplicationController
  before_action :set_categories
 

  def index
    @resources = Resource.all

    
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      flash[:notice] = "The resource was successfully created."
      redirect_to category_path(@resource.category)
    else
      flash[:alert] = "Resource was NOT created."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])

    if @resource.update(resource_params)
      redirect_to @resource
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.document.purge
    @resource.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def resource_params
      params.require(:resource).permit(:title, :document, :category_id)
    end

    def set_categories
    @categories = Category.all.order(:name)
    
    end
end
