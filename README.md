# Weather App - ClimaTrack

A Flutter App to view the present and next two day's climate for the given location. Shows basic details like:
* Temperature
* Humidity
* Wind speed
* Description of present condition
* Temperature actually felt

## Dependedncies Used

The following dependencies are used in this project:
* free_place_search
* geocoding
* geolocator
* http
* shared_preferences
* intl
* url_launcher

## Screenshots

<img> 
<img>

## My Notes

### Location permission

To provide permission for location, add the following line as 2nd line (before application) in android\app\src\main\AndroidManifest.xml

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/> 
```

To open link in browser, add the following line next to the above code.

```xml
<queries>
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="https" />
    </intent>
</queries>
```

## To Do

### Start Here
* Create a Logo.
* Create Splash Screen.
* Create a Welcome page.
* Swipe down to refresh.

### Bug Fixes
* Fix time zone showing multiple times for Today.
* Keyboard should automatically close when switched from search page to main page (to avoid pixels overflowing).

### Optional
* Create popup for showing detailed data about each time zone.
* Orange color for hot climate and blue color for cold climate.

### Location in PC
The project is located at 

D:\NIKHIL\New Flutter\New-folder\predict_placename\predict in PC (for personal references)


## Thanks :)

