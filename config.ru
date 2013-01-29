$: << File.dirname(__FILE__)

require 'rubygems'
require 'bundler'

Bundler.require(:default)

require 'application'
use Soundboard::Application
run Sinatra::Application