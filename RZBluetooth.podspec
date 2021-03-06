# -*- coding: utf-8 -*-
Pod::Spec.new do |s|
  s.name         = "RZBluetooth"
  s.version      = "1.2.1"
  s.summary      = "A Core Bluetooth helper library to simplify the development and testing of Core Bluetooth applications."

  s.description  = <<-DESC
RZBluetooth is a Core Bluetooth helper with 3 primary goals:

- Simplify the delegate callbacks and encourage best practices
- Provide a pattern for Profile level APIs, with support for public profiles
- Simplify and encourage testing - including unit tests, automated integration tests, and manual tests.
                   DESC

  s.homepage     = "http://github.com/Raizlabs/RZBluetooth"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Brian King" => "brianaking@gmail.com" }
  s.osx.deployment_target = "10.10"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/Raizlabs/RZBluetooth.git", :tag => s.version }
  s.requires_arc = true

  s.default_subspec = "Core"

  s.subspec "Core" do |core|
    core.source_files = "RZBluetooth/**/*.{h,m}"
    core.public_header_files = "RZBluetooth/**/*.h"
    core.private_header_files = "RZBluetooth/**/*+Private.h", "RZBluetooth/Command/*.h", "RZBluetooth/RZBCentralManager+CommandHelper.h"
  end

  s.subspec "Mock" do |mock|
    mock.dependency "RZBluetooth/Core"
    mock.source_files = "RZMockBluetooth/**/*.{h,m}"
    mock.public_header_files = "RZMockBluetooth/**/*.h"
    mock.private_header_files = "RZMockBluetooth/**/*+Private.h"
  end

  s.subspec "Test" do |test|
    test.dependency "RZBluetooth/Mock"
    test.frameworks = "XCTest"
    test.source_files = "RZBluetoothTests/RZBTestDefines.h",
                        "RZBluetoothTests/RZBSimulatedTestCase.{h,m}",
                        "RZBluetoothTests/Helpers/NSRunLoop+RZBWaitFor.{h,m}"
    test.public_header_files = "RZBluetoothTests/RZBSimulatedTestCase.h", "RZBluetoothTests/RZBTestDefines.h"
  end
end
