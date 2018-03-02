desc 'Confirmation all unconfirmed invoices'
task confirm_invoices: :environment do
  using DateRefinements

  if Date.today == Date.last_business_day_for_current_month - 1
    Invoice.where(confirmed: false).update(confirmed: true)
  end
end
