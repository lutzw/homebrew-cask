class Cask::PkgInstaller
  def initialize(cask, command=Cask::SystemCommand)
    @cask = cask
    @command = command
  end

  def install
    @cask.installers.each do |installer|
      ohai "Running installer for #{@cask}; your password may be necessary."
      @command.run("sudo installer -pkg '#{installer}' -target /")
    end
  end

  def uninstall
    @cask.uninstallers.each do |uninstaller|
      ohai "Running uninstaller for #{@cask}; your password may be necessary."
      @command.run("sudo '#{uninstaller}'")
    end
  end
end
