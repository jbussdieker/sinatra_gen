require 'fileutils'
require 'erb'

module SinatraGen
  class App
    attr_accessor :name

    def initialize(options)
      @options = options
      @name = options[:name] || "app"
      @root = options[:root] || File.join(Dir.pwd, @options[:name])
      @libdir = File.join(@root, "lib")
    end

    def generate
      FileUtils.mkdir_p File.join(@root, "..")
      Dir.chdir File.join(@root, "..")
      `bundle gem #{name}`

      run_template("config.ru")
      run_template("app.rb", "lib/#{name}")

      puts "Project generate at #{@root}"
    end

    def run_template(template_name, base_path="/")
      template = ERB.new(File.read(File.expand_path("../../../data/#{template_name}.erb", __FILE__)))
      data = template.result(binding)
      dst_file = File.join(@root, base_path, template_name)
      File.open(dst_file, 'w') {|f| f.write(data)}
    end
  end
end
