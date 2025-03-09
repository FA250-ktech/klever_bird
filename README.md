# klever_bird
A minimal, reproducible flutter app that cause shorebird patch ios to failed.

## First Time Installation

1. **Copy Environment File**
    ```sh
    cp .env.sample .env
    ```

2. **Install Flutter Dependencies**
    ```sh
    flutter pub get
    ```

3. **Install iOS Dependencies**
    ```sh
    cd ios
    pod install
    cd ..
    ```

4. **Run the Application**
    ```sh
    flutter run --target=lib/flavor/flavor_prod.dart --flavor=prod --verbose -- --dart-define-from-file=.env
    ```

5. **Build for iOS**
    ```sh
    flutter build ipa -t lib/flavor/flavor_prod.dart --flavor=prod --verbose -- --dart-define-from-file=.env
    ```

6. **Initialize Shorebird**
    ```sh
    shorebird init
    ```

7. **Release with Shorebird iOS**
    ```sh
    shorebird release ios --flutter-version=3.29.1 --target=lib/flavor/flavor_prod.dart --flavor=prod --verbose -- --dart-define-from-file=.env
    ```

8. **Patch with Shorebird iOS**
    ```sh
    shorebird patch --platforms=ios --target=lib/flavor/flavor_prod.dart --flavor=prod --verbose -- --dart-define-from-file=.env
    ```

### Optional: Rename Package

To rename the package, run:
```sh
dart run change_app_package_name:main com.new.package.name
```
Replace `com.new.package.name` with the new package name.