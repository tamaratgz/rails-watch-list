class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to lists_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end

# new_list_bookmark GET    /lists/:list_id/bookmarks/new(.:format)     bookmarks#new
# list_bookmarks POST   /lists/:list_id/bookmarks(.:format)            bookmarks#create
# list_bookmark DELETE /bookmarks/:id(.:format)                        bookmarks#destroy

#A user can add a new bookmark (movie/list pair) to an existing list
# Checkout simple_form docs about f.association to easily create a select dropdown for our list of movies.

# GET "lists/42/bookmarks/new"
# POST "lists/42/bookmarks"

# A user can delete a bookmark from a list. How can we make a delete link again?
# DELETE "bookmarks/25"
