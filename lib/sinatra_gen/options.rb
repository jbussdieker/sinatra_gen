module SinatraGen
  module Options
    def self.parse(args)
      options = {}
      options[:name] = args.first
      options
    end
  end
end
