module PartialCompiler
  require 'partial_compiler/railtie' if defined?(Rails)
end

require "partial_compiler/plugin"
require "partial_compiler/file_copier"
require "partial_compiler/partial_reader"
require "partial_compiler/compiler"
