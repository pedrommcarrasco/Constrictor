Pod::Spec.new do |s|
  s.swift_version = "4.1"
  s.name         = "Constrictor"
  s.version      = "0.1.0"
  s.summary      = "🐍 AutoLayout's µFramework"

  s.description  = "Constrictor's an group of UIView's extensions with the goal of simplyfing the use of constraints by code."

  s.homepage     = "https://github.com/pedrommcarrasco/Constrictor"
  s.license      = "MIT"

  s.author    = "Pedro Carrasco"
  s.social_media_url   = "http://twitter.com/pedrommcarrasco"

  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/pedrommcarrasco/Constrictor.git", :tag => "0.1.0" }

  s.source_files  = "Constrictor/**/*"
end
