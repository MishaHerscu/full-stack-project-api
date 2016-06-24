# Controller helpers
# Source: http://stackoverflow.com/questions/10121835/how-do-i-simulate-a-login-with-rspec

# module with sign_in method
module ControllerHelpers
  def sign_in(user)
    # if user.nil?
    #   allow(request.env['warden'])
    #   .to receive(:authenticate!)
    #   .and_throw(:warden, {:scope => :user})
    #   allow(controller).to receive(:current_user).and_return(nil)
    # else
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    # end
  end
end
