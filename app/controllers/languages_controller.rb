class LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.json
  def index
    @languages = Language.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @languages }
    end
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to @language, notice: 'El lenguaje fue creado de manera exitosa!' }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { render action: 'new' }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to @language, notice: 'El lenguaje se actualizo de manera exitosa!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language = Language.find(params[:id])
    @concepts = @language.concepts
    @concepts.each do |c|
      @sub_concepts = c.sub_concepts
      @sub_concepts.each do |sc|
        sc.destroy
      end
      c.destroy
    end
    @language.destroy
    flash[:notice] = 'El lenguaje fue borrado de manera exitosa!'
    respond_to do |format|
      format.html { redirect_to languages_url }
      format.json { head :no_content }
    end
  end
end
