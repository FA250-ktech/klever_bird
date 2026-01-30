# klever_bird
A minimal, reproducible flutter app that cause shorebird patch ios to failed.

## Version
Flutter : 3.38.7
Dart : 3.10.7
Android SDK & Build-tool : 35
JDK : 21.0.3
Gradle : 8.9
Xcode : 17A400
CocoaPods : 1.16.2
Shorebird : 1.6.78

## First Time Installation

1. **Install Flutter Dependencies**
    ```sh
    flutter pub get
    ```

2. **Install iOS Dependencies**
    ```sh
    cd ios
    pod install
    cd ..
    ```

3. **Run the Application**
    ```sh
    flutter run --target=lib/flavor/flavor_prod.dart --flavor=prod --verbose
    ```

4. **Build**
    ```sh
    flutter build ipa -t lib/flavor/flavor_prod.dart --flavor=prod --verbose
    ```
    ```sh
    flutter build appbundle --release --flavor=prod --target=lib/flavor/flavor_prod.dart --verbose
    ```

5. **Initialize Shorebird**
    ```sh
    shorebird init
    ```
    

6. **Release with Shorebird**
    ```sh
    shorebird release ios --flutter-version=3.38.7 --target=lib/flavor/flavor_prod.dart --verbose
    ```
    ```sh
    shorebird release android --artifact=apk --flutter-version=3.38.7 --target=lib/flavor/flavor_prod.dart  --verbose
    ```

7. **Patch with Shorebird**
    ```sh
    shorebird patch --platforms=ios --target=lib/flavor/flavor_prod.dart --verbose
    ```
    ```sh
    shorebird patch --platforms=android --target=lib/flavor/flavor_prod.dart --verbose
    ```

### Optional: Rename Package

To rename the package, run:
```sh
dart run change_app_package_name:main com.new.package.name
```
Replace `com.new.package.name` with the new package name.