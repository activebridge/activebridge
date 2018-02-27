class DownloadController < ApplicationController
  before_action :parse_params, only: :invoices
  before_filter :authenticate

  def invoices
    @result = Invoice.where(date: begin_date..end_date).order('date ASC')
    render "invoices.xlsx.axlsx"
  end

  private

  def parse_params
    if params[:date].include?('from')
      params[:date].gsub('from+', '01-').gsub('to+', '01-').split('+')
    else
      ('01-' + params[:date]).split
    end
  end

  def begin_date
    Date.parse(parse_params[0])
  end

  def end_date
    if parse_params[1].nil?
      begin_date.beginning_of_month.next_month - 1
    else
      Date.parse(parse_params[1]).beginning_of_month.next_month - 1
    end
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USER'] && password == ENV['SECRET']
    end
  end
end
