#
class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all

    render json: @attendances
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    render json: @attendance
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      render json: @attendance, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    if @attendance.update(attendance_params)
      head :no_content
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy

    head :no_content
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:player_id, :game_id)
  end
end
