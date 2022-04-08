require 'pathname'
require 'uri'
require 'net/http'
require_relative 'helpers/path_validation'

class ReplayFileParser
  include PathValidation

  def initialize(file_path)
    @file_path = file_path
  end

  def parse
    pathname_error! unless valid_filepath?(pathname(@file_path))
    # uri = URI.parse('http://localhost:5600/')
    # data = File.read(pathname)
    # response = Net::HTTP.start(uri.host, uri.port, write_timeout: 500) do |http|
    #   http.post(uri.path, data, "Content-Type" => "application/x-www-form-urlencoded")
    # end
    # puts response.status
    # puts response
  end

  private

  def log_and_raise(e: nil)
    # @TODO log the error somewhere
    pathname_error!
  end
end
