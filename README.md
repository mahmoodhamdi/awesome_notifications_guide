# Awesome Notifications Guide 🔔

A comprehensive Flutter example demonstrating how to implement and use the Awesome Notifications package for creating rich, interactive notifications in your Flutter applications.

## 🌟 Features

- 📱 Create basic notifications with title and body
- 🖼️ Display notifications with large icons and big pictures
- ⏰ Schedule notifications
- 🎯 Handle notification actions and responses
- 🔄 Background task execution
- 🎨 Customizable notification layouts
- 🔔 Badge counter management

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- Basic understanding of Flutter development

### Installation

1- Add the following dependency to your `pubspec.yaml`

```yaml
dependencies:
  awesome_notifications: ^[latest_version]
```

2- Run:

```bash
flutter pub get
```

## ⚙️ Configuration

### 🤖 Configuring Android for Awesome Notifications

1- Configure minimum Android SDK requirements in `android/app/build.gradle`

```gradle
android {
    compileSdkVersion 34

    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 34
    }
}
```

2- Add required permissions in `android/app/src/main/AndroidManifest.xml`

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.myapp">
   <application>
        ...
    </application>
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
</manifest>
```

3- Export activities in `AndroidManifest.xml`

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.myapp">
   <application>
        <activity
            android:name=".MainActivity"
            android:exported="true">
                ...
        </activity>
    </application>
</manifest>
```

## 💡 Usage

### Initialization

```dart
await AwesomeNotificationsHelper.initializeLocalNotifications();
await AwesomeNotificationsHelper.initializeIsolateReceivePort();
```

### Creating a Basic Notification

```dart
await AwesomeNotificationsHelper.createNewNotification();
```

### Scheduling a Notification

```dart
await AwesomeNotificationsHelper.scheduleNewNotification();
```

### Managing Notifications

```dart
// Reset badge counter
await AwesomeNotificationsHelper.resetBadgeCounter();

// Cancel all notifications
await AwesomeNotificationsHelper.cancelNotifications();
```

## 🏗️ Project Structure

- `lib/`
  - `app.dart`
  - `main.dart`
  - `home_page.dart`
  - `notification_page.dart`
  - `awesome_notifications_helper.dart`

## 🛠️ Core Components

### AwesomeNotificationsHelper

A utility class that handles:

- Notification initialization
- Creation of notifications
- Scheduling notifications
- Permission management
- Action handling
- Background task execution

### NotificationPage

A dedicated page for displaying notification details, including:

- Title and body
- Large icons
- Big pictures
- Custom layouts

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## ✨ Acknowledgments

- Special thanks to the Awesome Notifications package maintainers

### Quote

> " مَن قالَ: لا إلَهَ إلَّا اللَّهُ، وحْدَهُ لا شَرِيكَ له، له المُلْكُ وله الحَمْدُ، وهو علَى كُلِّ شَيءٍ قَدِيرٌ، في يَومٍ مِئَةَ مَرَّةٍ؛ كانَتْ له عَدْلَ عَشْرِ رِقابٍ، وكُتِبَتْ له مِئَةُ حَسَنَةٍ، ومُحِيَتْ عنْه مِئَةُ سَيِّئَةٍ، وكانَتْ له حِرْزًا مِنَ الشَّيْطانِ يَومَهُ ذلكَ حتَّى يُمْسِيَ، ولَمْ يَأْتِ أحَدٌ بأَفْضَلَ ممَّا جاءَ به، إلَّا أحَدٌ عَمِلَ أكْثَرَ مِن ذلكَ "
>
> صحيح البخاري
