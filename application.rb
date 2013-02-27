module Soundboard
  class Application < Sinatra::Base

    set :logging, true

    def initialize(app)
      super(app)
    end

    def play(path)
     STDERR.puts path
     command = "cd #{settings.root} && "
     command << "osascript volume_down.scpt && "
     command << "afplay #{path} && "
     command << "osascript volume_up.scpt"

     `#{command}`
    end


    get '/play' do
      file = params['file']
      path = "#{settings.root}/audio/#{file}.m4a"
      directory = "#{settings.root}/audio/#{file}"

      if File.exists?(path)
        play(path)
      elsif File.exists?(directory)
        files = Dir.glob("#{directory}/*.m4a")
        file = files[rand(files.size)]
        play(file)
      else
        halt 404
      end
    end

  end
end