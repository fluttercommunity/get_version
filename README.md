[![Flutter Community: get_version](https://fluttercommunity.dev/_github/header/get_version)](https://github.com/fluttercommunity/community)

[![Buy Me A Coffee](https://img.shields.io/badge/Donate-Buy%20Me%20A%20Coffee-yellow.svg)](https://www.buymeacoffee.com/rodydavis)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WSH3GVC49GNNJ)
![github pages](https://github.com/fluttercommunity/get_version/workflows/github%20pages/badge.svg)

# get_version
![alt text](https://github.com/fluttercommunity/get_version/blob/master/screenshots/IMG_0023.PNG)

Online Demo: https://fluttercommunity.github.io/get_version/

## Description
Get the Version Name, Version Code and App ID on iOS and Android.

## Setup
### Android

Go to build.gradle and update:

```gradle
defaultConfig {
  versionCode 1
  versionName "1.0"
  minSdkVersion 16
  testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
}
```

### iOS

Already good to go.

## How to Use

Get OS Version:

```dart
String platformVersion;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  platformVersion = await GetVersion.platformVersion;
} on PlatformException {
  platformVersion = 'Failed to get platform version.';
}
```

Get Version Name:

```dart
String projectVersion;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  projectVersion = await GetVersion.projectVersion;
} on PlatformException {
  projectVersion = 'Failed to get project version.';
}
```

Get Version Code:

```dart
String projectCode;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  projectCode = await GetVersion.projectCode;
} on PlatformException {
  projectCode = 'Failed to get build number.';
}
```

Get App ID:

```dart
String projectAppID;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  projectAppID = await GetVersion.appID;
} on PlatformException {
  projectAppID = 'Failed to get app ID.';
}
```

Get App Name:

```dart
String projectName;
// Platform messages may fail, so we use a try/catch PlatformException.
try {
  projectName = await GetVersion.appName;
} on PlatformException {
  projectName = 'Failed to get app name.';
}
```
    
## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_version/get_version.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _projectVersion = '';
  String _projectCode = '';
  String _projectAppID = '';
  String _projectName = '';

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await GetVersion.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String projectVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectVersion = await GetVersion.projectVersion;
    } on PlatformException {
      projectVersion = 'Failed to get project version.';
    }

    String projectCode;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectCode = await GetVersion.projectCode;
    } on PlatformException {
      projectCode = 'Failed to get build number.';
    }

    String projectAppID;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }
    
    String projectName;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      projectName = await GetVersion.appName;
    } on PlatformException {
      projectName = 'Failed to get app name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _projectVersion = projectVersion;
      _projectCode = projectCode;
      _projectAppID = projectAppID;
      _projectName = projectName;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Container(
                height: 10.0,
              ),
              new ListTile(
                leading: new Icon(Icons.info),
                title: const Text('Name'),
                subtitle: new Text(_projectName),
              ),
              new Container(
                height: 10.0,
              ),
              new ListTile(
                leading: new Icon(Icons.info),
                title: const Text('Running on'),
                subtitle: new Text(_platformVersion),
              ),
              new Divider(
                height: 20.0,
              ),
               new ListTile(
                leading: new Icon(Icons.info),
                title: const Text('Version Name'),
                subtitle: new Text(_projectVersion),
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                leading: new Icon(Icons.info),
                title: const Text('Version Code'),
                subtitle: new Text(_projectCode),
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                leading: new Icon(Icons.info),
                title: const Text('App ID'),
                subtitle: new Text(_projectAppID),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
