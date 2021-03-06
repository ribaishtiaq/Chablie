class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query  = params[:query].gsub('#', '')
      @chables = Chable.joins(:tags).where(tags: {name:    query})
      @comments = Comment.joins(:tags).where(tags: {name:    query})
    else
      @chables = Chable.where("content like ?", "%#{params[:query]}%")
      @comments = Comment.where("body like ?", "%#{params[:query]}%")
    end
  end
end
