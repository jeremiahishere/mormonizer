class TranslationsController < ApplicationController
  def index
    @translation = Translation.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @translation = Translation.new(params[:translation])
    @translation.user = current_user

    respond_to do |format|
      if @translation.save
        format.json { render :json => {:output_text => @translation.output_text } }
      else
        format.json { render :json => {:output_text => "There were errors in the form" } }
      end
    end
  end
end
