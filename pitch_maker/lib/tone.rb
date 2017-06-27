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
		@window.mouse_x_percent
	end

	def speed
		1
	end

	def update
		puts "V: #{volume}, S: #{speed}"
		if playing?
			@instance.volume = volume
			@instance.speed = speed
		end
	end

end