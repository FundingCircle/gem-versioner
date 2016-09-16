require 'rubygems/versioner'
require 'rubygems/package'

module Gem
  # main Gem::Package of rubygems
  class Package
    class << self
      alias build_original build

      def build(spec, skip_validation = false)
        spec.version = Gem::Versioner.release_version(spec.version)
        build_original(spec, skip_validation)
      end
    end
  end
end
