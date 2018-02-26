class DownloadController < ApplicationController
  def invoices
    date = Date.parse(params[:date])
    @result = Invoice.where(date: date)

    render "invoices.xlsx.axlsx"
  end

end
