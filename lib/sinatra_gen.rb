require "sinatra_gen/version"
require "sinatra_gen/options"
require "sinatra_gen/app"

module SinatraGen
  def self.configure(options)
    @options = options
  end

  def self.run
    App.new(@options).generate
  end

  def self.generate(options={})
    configure(options)
    run
  end
end
