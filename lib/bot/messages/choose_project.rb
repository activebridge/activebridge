# frozen_string_literal: true
module Bot::Messages::ChooseProject
  def generate
    {
      channel: @channel_id,
      text: 'Please, select your customer:',
      as_user: true,
      attachments: attachments
    }
  end

  private

  def attachments
    attachments = []
    grouped_customers_buttons.each do |buttons|
      attachments << attachment(buttons)
    end

    attachments
  end

  def attachment(buttons)
    {
      text: '',
      fallback: 'You are not able to check the project.',
      callback_id: 'choose_project',
      color: '#439FE0',
      attachment_type: 'default',
      actions: buttons
    }
  end

  def grouped_customers_buttons
    customers_buttons = []
    return customers_buttons unless company

    # batch_size is 5: limit for slack interactive buttons
    company.customers.find_in_batches(batch_size: 5) do |group|
      grouped_buttons = []
      group.each do |customer|
        grouped_buttons << button(customer)
      end

      customers_buttons << grouped_buttons
    end

    customers_buttons
  end

  def button(customer)
    {
      name: 'customer',
      text: customer.name,
      type: 'button',
      value: customer.id
    }
  end

  def company
    @company ||= Company.find company_id
  end
end
