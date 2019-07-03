# when this is instantiated, you can access a variable that contains a list of song sm/ssc filenames
# todo: if sm and ssc, only get ssc
class ParseSongDir
	songs_dir = "/Users/ian/stepMania/Songs"
	# all_sm_ssc = Dir.glob(songs_dir+ "/**/*{sm,ssc}") # won't grab symlinks
# this is cursed
# globs over symlinks
# https://stackoverflow.com/a/2724048/1234621
# easily replaceable by assuming the structure of the directory to be a tree with only three levels and then just for looping over it
# puts Dir.glob("/Users/ian/stepMania/Songs/**{,/*/**}/*") 
	all_sm_ssc = Dir.glob("/Users/ian/stepMania/Songs/**{,/*/**}/*{sm,ssc}") 

	# i don't understand anything of ruby's classes, so i'm sure this is doing
	# something silly like recomputing the list of songnames every time this
	# object is instantiated.
	# 
	# which, for a single-use object, seems totally fine.

	@songnames = all_sm_ssc.map{|arg| File.basename(arg)}
	class << self
	  attr_accessor :songnames
	end
end
