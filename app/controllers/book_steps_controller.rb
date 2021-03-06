class BookStepsController < ApplicationController

  before_filter :get_book

  # GET /book_steps
  # GET /book_steps.json
  def index
    @book_steps = @book.book_steps.all
    @book = @book

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_steps }
    end
  end

  # GET /book_steps/1
  # GET /book_steps/1.json
  def show
    @book_step = BookStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_step }
    end
  end

  # GET /book_steps/new
  # GET /book_steps/new.json
  def new
    @book_step = BookStep.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_step }
    end
  end

  # GET /book_steps/1/edit
  def edit
    @book_step = BookStep.find(params[:id])
  end

  # POST /book_steps
  # POST /book_steps.json
  def create
    @book_step = BookStep.new(params[:book_step])

    respond_to do |format|
      if @book_step.save
        format.html { redirect_to @book_step, notice: 'Book step was successfully created.' }
        format.json { render json: @book_step, status: :created, location: @book_step }
      else
        format.html { render action: "new" }
        format.json { render json: @book_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_steps/1
  # PUT /book_steps/1.json
  def update
    @book_step = BookStep.find(params[:id])

    respond_to do |format|
      if @book_step.update_attributes(params[:book_step])
        format.html { redirect_to @book_step, notice: 'Book step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_steps/1
  # DELETE /book_steps/1.json
  def destroy
    @book_step = BookStep.find(params[:id])
    @book_step.destroy

    respond_to do |format|
      format.html { redirect_to book_steps_url }
      format.json { head :no_content }
    end
  end

  private 

  def get_book
    @book = Book.find(params[:book_id])
  end

end
