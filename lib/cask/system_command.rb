class Cask::SystemCommand
  def self.run(command, input='')
    IO.popen("#{command} 2>&1", 'r+') do |pipe|
      pipe.puts input
      pipe.close_write
      while line = pipe.gets
        ohai line.chomp
      end
    end
  end
end
