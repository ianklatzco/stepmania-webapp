# myapp.rb
require 'sinatra'
require_relative 'parse_songdir'

get '/' do
  @ary = ParseSongDir.songnames # lol you don't even need to instantiate the class
  print @ary
  erb :'songlist'
end
