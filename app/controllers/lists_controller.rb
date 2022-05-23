class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

# lists     GET    /lists(.:format)       lists#index
# A user can see all the lists (index) GET "lists"

# new_list  GET    /lists/new(.:format)   lists#new
#           POST   /lists(.:format)       lists#create
# A user can create a new list # GET "lists/new" + POST "lists"

# list      GET    /lists/:id(.:format)   lists#show
# A user can see the details of a given list and its name (show) # GET "lists/42"
