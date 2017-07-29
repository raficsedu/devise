class TicketLoopsController < ApplicationController
  before_action :set_ticket_loop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  # GET /ticket_loops
  # GET /ticket_loops.json
  def index
    @ticket_loops = TicketLoop.all
  end

  # GET /ticket_loops/1
  # GET /ticket_loops/1.json
  def show
  end

  # GET /ticket_loops/new
  def new
    @ticket_loop = TicketLoop.new
  end

  # GET /ticket_loops/1/edit
  def edit
  end

  # POST /ticket_loops
  # POST /ticket_loops.json
  def create
    @ticket_loop = TicketLoop.new(ticket_loop_params)
    @ticket_loop.role = @user.role
    Ticket.find(@ticket_loop.ticket_id).update_attribute(:status, 'open')

    respond_to do |format|
      if @ticket_loop.save
        format.html { redirect_to :back, notice: 'Reply created successfully.' }
        format.json { render :show, status: :created, location: @ticket_loop }
      else
        format.html { render :new }
        format.json { render json: @ticket_loop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_loops/1
  # PATCH/PUT /ticket_loops/1.json
  def update
    respond_to do |format|
      if @ticket_loop.update(ticket_loop_params)
        format.html { redirect_to @ticket_loop, notice: 'Ticket loop was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_loop }
      else
        format.html { render :edit }
        format.json { render json: @ticket_loop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_loops/1
  # DELETE /ticket_loops/1.json
  def destroy
    @ticket_loop.destroy
    respond_to do |format|
      format.html { redirect_to ticket_loops_url, notice: 'Ticket loop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_loop
      @ticket_loop = TicketLoop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_loop_params
      params.require(:ticket_loop).permit(:ticket_id, :description)
    end
end
