class profiles::ubuntu::java {
  # specifying this here lets me specify to use 'jre' and
  #   I can include/require this in other classes without getting
  #   the dreaded "redeclaration" error
  # on Ubuntu, calling it this way installs openjdk-8-jre-headless
  # the 'java' module is provided by puppetlabs/java 
  #   (see additionalModules.txt)
  class {
    'java':
      distribution => 'jre'
  }
}
