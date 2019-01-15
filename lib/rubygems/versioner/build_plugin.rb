# frozen_string_literal: true

require 'rubygems/versioner'
require 'rubygems/package'

module Gem
  # main Gem::Package of rubygems
  class Package
    class << self
      alias build_original build

      def build(spec, skip_validation = false, strict_validation = false, file_name = nil)
        spec.version = Gem::Versioner.release_version(spec.version)

        if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('3.0.0')
          build_original(spec, skip_validation, strict_validation = false, file_name = nil)
        else
          build_original(spec, skip_validation)
        end
      end
    end
  end
end
