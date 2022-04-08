require 'thor'
require_relative 'lib/replay_file_parser'
require_relative 'lib/replay_event_processor'
require_relative 'lib/client/open_dota'

class D2Replay < Thor
  desc "parse FILE_PATH", "parse the given dota2 replay file w/ OpenDota's replay parser"
  def parse(file_path)
    ReplayFileParser.new(file_path).parse
  end

  desc "ingest_events FILE_PATH", "create queryable/sortable replay events from the given list of game events"
  def ingest_events(file_path)
    ReplayEventProcessor.new(file_path).ingest_events
  end

  desc "fetch_match API_KEY ID", "fetch match data from the OpenDota API"
  def fetch_match(api_key, id)
    Client::OpenDota.new(api_key: api_key).fetch_match(id: id)
  end
end