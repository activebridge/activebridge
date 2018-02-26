class DownloadController < ApplicationController
  before_action :parse_params, only: :invoices

  def invoices
    date = parse_params
    d0 = Date.parse(date[0])

    if date[1].nil?
      d1 = d0.beginning_of_month.next_month - 1
    else
      d1 = Date.parse(date[1]).beginning_of_month.next_month - 1
    end

    @result = Invoice.where(date: d0..d1).order('date ASC')

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

  def last_month
  end
end
