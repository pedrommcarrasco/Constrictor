Pod::Spec.new do |s|
  s.swift_version = "4.1"
  s.name         = "Constrictor"
  s.version      = "0.1.2"
  s.summary      = "🐍 AutoLayout's µFramework"

  s.description  = "Constrictor's a group of UIView's extensions with the goal of simplyfing the use of constraints by code."

  s.homepage     = "https://github.com/pedrommcarrasco/Constrictor"
  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.author    = "Pedro Carrasco"
  s.social_media_url   = "http://twitter.com/pedrommcarrasco"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/pedrommcarrasco/Constrictor.git", :tag => s.version.to_s }

  s.source_files  = "Constrictor/Constrictor/**/*"
end
