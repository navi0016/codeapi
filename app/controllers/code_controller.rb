class CodeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def ruby
  end
  def post_ruby
    require 'sicuro'
    @code = params[:step][:code]
    @codeResult = Sicuro.eval(@code)
    render json:  CGI::escapeHTML(@codeResult.stdout.to_s).gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end
end
