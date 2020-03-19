require "./lib/CLIproject/version"
require "resolv-replace"

require_relative "./CLIproject/cli"
require_relative "./CLIproject/api"
require_relative "./CLIproject/pokemoncard"


require "pry"
require "httparty"

module CLIproject
  class Error < StandardError; end
  # Your code goes here...
end
