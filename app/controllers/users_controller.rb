class UsersController < ApplicationController

TWILIO_SID = "ACc32069ff4fb192befcc9bc5a9a7cf811"
TWILIO_AUTH = "44e2fec69e25d9fbda3543b96de7c0e9"
TWILIO_NUMBER = "302-416-5950"


def new
@user = User.new
end

def create
@user = User.new(params[:user])
if @user.save
render text: "Thanks for signing up. You should have an SMS messages."
require 'twilio-ruby'

@twilio_client = Twilio::REST::Client.new(
TWILIO_SID,
TWILIO_AUTH
)

@twilio_client.account.sms.messages.create(
:from => TWILIO_NUMBER,
:to => @user.phone,
:body => "Here is the LINK to download Lokalty - http://itunes.apple.com/us/app/lokalty/id475950713?mt=8"
)



else
render :new
end
end

end
