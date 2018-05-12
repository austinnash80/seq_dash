class MailingSchedulesController < ApplicationController
  before_action :set_mailing_schedule, only: [:show, :edit, :update, :destroy]

  # GET /mailing_schedules
  # GET /mailing_schedules.json
  def index
    @mailing_schedules = MailingSchedule.all
  end

  # GET /mailing_schedules/1
  # GET /mailing_schedules/1.json
  def show
  end

  # GET /mailing_schedules/new
  def new
    @mailing_schedule = MailingSchedule.new
  end

  # GET /mailing_schedules/1/edit
  def edit
  end

  # POST /mailing_schedules
  # POST /mailing_schedules.json
  def create
    @mailing_schedule = MailingSchedule.new(mailing_schedule_params)

    respond_to do |format|
      if @mailing_schedule.save
        format.html { redirect_to @mailing_schedule, notice: 'Mailing schedule was successfully created.' }
        format.json { render :show, status: :created, location: @mailing_schedule }
      else
        format.html { render :new }
        format.json { render json: @mailing_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailing_schedules/1
  # PATCH/PUT /mailing_schedules/1.json
  def update
    respond_to do |format|
      if @mailing_schedule.update(mailing_schedule_params)
        format.html { redirect_to @mailing_schedule, notice: 'Mailing schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailing_schedule }
      else
        format.html { render :edit }
        format.json { render json: @mailing_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailing_schedules/1
  # DELETE /mailing_schedules/1.json
  def destroy
    @mailing_schedule.destroy
    respond_to do |format|
      format.html { redirect_to mailing_schedules_url, notice: 'Mailing schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailing_schedule
      @mailing_schedule = MailingSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailing_schedule_params
      params.require(:mailing_schedule).permit(:mail_id, :drop_date, :30_group, :60_group, :90_group)
    end
end
