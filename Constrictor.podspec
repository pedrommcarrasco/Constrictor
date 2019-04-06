Pod::Spec.new do |s|
  s.swift_version = "5.0"
  s.name         = "Constrictor"
  s.version      = "6.0.1"
  s.summary      = "🐍 Constrict your layout in Swift"

  s.description  = "Constrict your Auto Layout code with Constrictor, your chainable sugar."

  s.homepage     = "https://github.com/pedrommcarrasco/Constrictor"
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.author    = "Pedro Carrasco"
  s.social_media_url   = "http://twitter.com/pedrommcarrasco"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/pedrommcarrasco/Constrictor.git", :tag => s.version.to_s }

  s.source_files  = "Constrictor/Constrictor/**/*"
  s.exclude_files = "Constrictor/Constrictor/*.plist"
end
