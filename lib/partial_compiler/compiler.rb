require 'find'

module PartialCompiler
  class Compiler
    attr_accessor :files

    def initialize
      @files = FileCopier.create_files
      @files.each do |file|
        find_partials(file) 
      end
    end

    private

    def find_partials compiled_file_path
      text = File.open(compiled_file_path).read
      compiled_content = ""
      text.each_line do |line|
        compiled_content += read_each_line(line, compiled_file_path)
      end
      compiled_content.to_s.encode('UTF-8', {
        :invalid => :replace,
        :undef   => :replace,
        :replace => '?'
      })
      File.open(compiled_file_path, "w") {|file| file.puts compiled_content }
    end

    def read_each_line line, compiled_file_path
      if line.include? RENDERING_ENGINE_PARTIAL_FORMAT 
        file = PartialReader.new(line, compiled_file_path)
        return file.contents if file.contents
      end
      line
    end

  end
end
