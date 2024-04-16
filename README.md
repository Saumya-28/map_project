# map_project

A Flutter project demonstating the integration of Google Maps.

# About

This project provides step by step guidance on How to integrate Google Maps in Flutter.

# Prerequisites for Google Map
- Enable Google Maps API: Within the Google Cloud Platform console, we need to enable the Google Maps Platform and choose the specific APIs we want to use, To enable Google Maps for Android, select "Maps SDK for Android" in the "Additional APIs" section, then select "ENABLE".
  
- google_map_flutter :  install the google_maps_flutter package, which provides a Flutter plugin for integrating Google Maps. This package allows us to embed interactive maps directly into your Flutter app and customize their appearance and functionality.

#  Setting Up Google Maps
 Step 1: defining your package in pubspec.yaml 

 ```
dependencies:
  google_maps_flutter: ^2.6.0
```
Step 2: Set the ```minSdkVersion``` in ```android/app/build.gradle```:

```
android {
    defaultConfig {
        minSdkVersion 20
    }
}
```
Step 3: AndroidManifest.xml

```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

Click [here](https://docs.google.com/presentation/d/15_pS4obi7TB6qrqa6Gha7KqbPmdmYJGdRXrI0tquD70/edit?usp=sharing) to check my presentation.
<br></br>
Happy Coding!
