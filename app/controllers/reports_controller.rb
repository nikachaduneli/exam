class ReportsController < ApplicationController
  before_action :require_user, only: [:booking_report]
  def booking_report
    if current_user.admin?
      @filters = [:date_start, :date_end, :hotel_id]
      @bookings = filter(Booking.all)
    else
      @filters = [:date_start, :date_end]
      @bookings = Booking.all.where(user_id: current_user.id)
      @bookings = filter(@bookings)
      end
  end

  private
  def got_param(param)
    @filters.include?(param) and params[param] and !params[param].empty?
  end

  def filter(bookings)
    if got_param :hotel_id
      bookings = bookings.where(hotel_id: params[:hotel_id])
    end
    if got_param :date_start
      bookings = bookings.where('date_start >= ?', params[:date_start])
    end
    if got_param :date_end
      bookings = bookings.where('date_end <= ?', params[:date_end])
    end
    bookings
  end
end
