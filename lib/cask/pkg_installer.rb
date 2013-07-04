class Cask::PkgInstaller
  def initialize(cask, command=Cask::SystemCommand)
    @cask = cask
    @command = command
  end

  def install
    @cask.installers.each do |installer|
      ohai "Running installer for #{@cask}; your password may be necessary."
      @command.run("installer", {
        :sudo => true,
        :args => %W[-pkg #{installer} -target /]
      })
    end
  end

  def uninstall
    @cask.uninstallers.each do |uninstaller, options|
      ohai "Running uninstaller for #{@cask}; your password may be necessary."
      @command.run(uninstaller, options.merge(:sudo => true))
    end
  end
end
