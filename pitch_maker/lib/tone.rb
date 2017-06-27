class Tone

 SOUND_FILE = 'ex1.wav'

	 def initialize(window)
	 	@window = window
	 	file_path = File.expand_path(File.join('sounds', SOUND_FILE))
	 	@sample = Gosu::Sample.new(window,file_path)
	 end

	def start
		if @instance
			@instance.resume
		else
			@instance = @sample.play(volume, speed, true)
		end
	end

	def stop
		# @instance.stop if playing?
		@instance.pause if playing?
	end

	def playing?
		@instance && @instance.playing?
	end

	def volume
		1
	end

	def speed
		1
	end

end