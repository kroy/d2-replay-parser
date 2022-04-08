require_relative 'helpers/path_validation'
require 'json'

class ReplayEventProcessor
  include PathValidation

  def initialize(file_path)
    @file_path = file_path
  end

  def ingest_events
    pathname_error! unless valid_filepath?(pathname(@file_path))
    pathname(@file_path).each_line do |line|
      line_hash = JSON.parse(line)
      puts line_hash if line_hash["type"] == "interval"
    end
  end

  private

  def interval_events
    
  end
end