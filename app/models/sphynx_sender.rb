class SphynxSender < ActiveRecord::Base
    def self.send(image, sender, recipient)
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    begin
     @client.account.messages.create(
       :from => '+17272281142',
       :to => recipient,
       :body => "From #{sender}, courtesy of send-a-sphynx... you're welcome.",
       :MediaUrl => image
       )

    rescue Twilio::REST::RequestError => e
      puts e.message
    end
    return true
  end
end
