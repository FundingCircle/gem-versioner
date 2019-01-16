# frozen_string_literal: true

module Gem
  module Versioner
    def self.release_version(gem_version)
      if ENV.key?('PRE_RELEASE')
        "#{gem_version}.pre.#{ENV.fetch('PRE_RELEASE').gsub(/[^[:alnum:]]/, '')}.#{Time.now.strftime('%Y%m%d%H%M%S')}"
      else
        gem_version
      end
    end
  end
end
