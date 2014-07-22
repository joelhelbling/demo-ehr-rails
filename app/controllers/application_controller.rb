class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :request_tokens

  def request_tokens
    PaRequest.select('cmm_token').inject([]) {|acc,n| acc.push("'#{n.cmm_token}'")}
  end
  
end
