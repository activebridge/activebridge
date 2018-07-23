RSpec.shared_examples 'generate a message' do
  let(:message) { Bot::Message.new(params) }
  let(:generated_message) { message.extend(subject).generate }

  it { expect(generated_message).to eq options }
end
