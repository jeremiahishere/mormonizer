module Admin
  class LanguagesController < ApplicationController
    load_and_authorize_resource

    # GET /admin/languages
    def index
      @languages = Language.all

      respond_to do |format|
        format.html # index.html.erb
      end
    end

    # GET /admin/languages/1
    def show
      @language = Language.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # GET /admin/languages/new
    def new
      @language = Language.new

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /admin/languages/1/edit
    def edit
      @language = Language.find(params[:id])
    end

    # POST /admin/languages
    def create
      @language = Language.new(params[:language])

      respond_to do |format|
        if @language.save
          format.html { redirect_to admin_language_path(@language), notice: 'Language was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    # PUT /admin/languages/1
    def update
      @language = Language.find(params[:id])

      respond_to do |format|
        if @language.update_attributes(params[:language])
          format.html { redirect_to admin_language_path(@language), notice: 'Language was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    # DELETE /admin/languages/1
    def destroy
      @language = Language.find(params[:id])
      @language.destroy

      respond_to do |format|
        format.html { redirect_to admin_languages_url }
      end
    end
  end
end
