# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|

  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  # Specify the path to a local JSON file with Ohai data (default: nil)
  # config.path = 'ohai.json'

  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '16.04'

  # When using ChefSpec::ServerRunner, specify the data storage method (options: in_memory, on_disk; default: in_memory)
  # If you are in a low-memory environment, setting this value to :on_disk may improve speed and/or reliability.
  config.server_runner_data_store = :on_disk

  # Whether or not to clear the cookbooks on the ChefZero instance in-between each test (default: true)
  # For most people, not clearing the cookbooks will drastically improve test execution time. This is a
  # good option for people who are using chefspec within the context of a single Berksfile or Policyfile.
  config.server_runner_clear_cookbooks = false
end
