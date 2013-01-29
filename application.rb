module Soundboard
  class Application < Sinatra::Base

    def initialize(app)
      super(app)
    end

    get '/play' do
      file = params['file']
      path = "#{settings.root}/audio/#{file}.m4a"

      if File.exists?(path)
        command = "cd #{settings.root} && "
        command << "osascript volume_down.scpt && "
        command << "afplay #{path} && "
        command << "osascript volume_up.scpt"

        `#{command}`
      else
        halt 404
      end
    end

  end
end