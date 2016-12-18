platform :ios, '9.0'

use_frameworks!

target "Swift-DGtle" do

pod 'Kingfisher', '~> 3.0'
pod 'SDCycleScrollView'
pod 'SnapKit'
pod 'MJRefresh'
pod 'Alamofire', '~> 4.0'
pod 'SVProgressHUD'

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
        end
    end
end
