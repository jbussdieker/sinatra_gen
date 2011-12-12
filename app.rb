require 'sinatra'

class TemplateApp < Sinatra::Base
  get '/' do
    "Hello World!"
  end
end
