platform :osx, '10.9'

pod 'OCLogTemplate'
pod 'IGHTMLQuery', '~> 0.8.4'

post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
    end
  end
end
