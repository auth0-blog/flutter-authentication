# Get Started with Flutter Authentication

Read [Get Started with Flutter Authentication](https://auth0.com/blog/get-started-with-flutter-authentication/) to learn how to build the application hosted in this repository.

[Flutter](https://flutter.dev/) is Google's cross-platform UI toolkit created to help developers build expressive and beautiful mobile applications. In the article, you will learn how to build and secure a Flutter application with Auth0 using the open-source [AppAuth](https://appauth.io/) library with the [`flutter_appauth`](https://pub.dev/packages/flutter_appauth) wrapper plugin.

## What You'll Build

| ![Flutter login screen](https://cdn.auth0.com/blog/get-started-with-flutter-authentication/flutter-login-screen.png)                           | ![Auth0 prompt page in a Flutter app](https://cdn.auth0.com/blog/get-started-with-flutter-authentication/flutter-consent-prompt.png) |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| ![Auth0 Universal Login Page in a Flutter app](https://cdn.auth0.com/blog/get-started-with-flutter-authentication/flutter-universal-login.png) | ![Flutter profile screen](https://cdn.auth0.com/blog/get-started-with-flutter-authentication/flutter-profile-screen.png)             |

## Project Setup

- Clone project.

- Install dependencies by clicking "Pub get" in your IDE or run the following command in the project root:

```bash
flutter pub get
```

## Set Up Auth0

Auth0 is an Identity-as-a-Service (IDaaS) platform that provides developers with features such as [Social](https://auth0.com/learn/social-login/) and [Passwordless Login](https://auth0.com/passwordless), among others, to ease online identity management.

To integrate Auth0 into your Flutter app, you need an Auth0 account. If you have an existing account, you can use it. If you don't, <a href="https://auth0.com/signup">click here to create a free account</a>.

After creating an Auth0 account, follow the steps below to set up an application:

- Go to the [Applications](https://manage.auth0.com/#/applications) section of your dashboard.
- Click on the "Create Application" button.
- Enter a name for your application (e.g., "Flutter Application").
- Finally, select **Native** as the application type and click the Create button.

![Auth0 Create application screen for Flutter app](https://cdn.auth0.com/blog/-get-started-with-flutter-authentication/flutter-auth0-create-application.png)

Your application should have at least one enabled Connection. Click on the "Connections" tab on your application page and switch on any database or social identity provider (e.g., Google).

![Auth0 connections for Flutter apps](https://cdn.auth0.com/blog/-get-started-with-flutter-authentication/flutter-app-auth0-connections.png)

Finally, navigate to the "Settings" tab on your application page and set a callback URL in the **Allowed Callback URLs** field. For this demo, your callback URL should be the following value:

```text
com.auth0.flutterdemo://login-callback
```

Here is how it should look in your Application settings page:

![Auth0 callback settings for Flutter apps](https://cdn.auth0.com/blog/-get-started-with-flutter-authentication/flutter-app-auth0-callback.png)

Once you set the callback URL value, scroll to the bottom of the page and click on the "Save Changes" button. You should receive a confirmation message stating that your changes have been saved.

The purpose of the callback URL is to provide a mechanism by which an authorization server communicates back to your Flutter application.

Open `lib/main.dart` and update the "Auth0 Variables" section with the values from your Auth0 Application settings:

- `AUTH0_DOMAIN` is the value of the **Domain**.

- `AUTH0_CLIENT_ID` is the value of the **Client ID**.

## Run the Application

Launch either the [iOS simulator](https://flutter.dev/docs/get-started/install/macos#set-up-the-ios-simulator) or [Android emulators](https://flutter.dev/docs/get-started/install/macos#set-up-the-android-emulator), then run the application on all available devices like so:

```bash
flutter run -d all
```
