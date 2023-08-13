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
* All Done

### Bug Fixes
* Fix time zone showing multiple times for Today. - That's a feature 😎

### Optional
* Create popup for showing detailed data about each time zone.
* Orange color for hot climate and blue color for cold climate.

### Location in PC
The project is located at

D:\NIKHIL\New Flutter\New-folder\predict_placename\predict in PC (for personal references)


## Thanks :)
