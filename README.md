# VolleyTemplate
Android Studio template for quickly creating a Volley based networking app. Many times, in coding interviews, you are asked to create a list of items fetched from the network. This template helps you create a solution quickly. Saves you a lot of boiler plate code.

You need to copy this file to the location where Android Studio stores its templates. This location depends on the operating system you are using. e.g. on my MacBook, it is:
>"/Applications/Android Studio.app/Contents/plugins/android/lib/templates".

On Windows and Linux, you can find out based on the installation location of Android Studio.
This template creates a fragment with a recyclerview. It assumes that you are going to fetch data from the network as a list of things e.g. movies, stocks, employees, photos and so on. You need the following steps to create a working solution
1. Complete the object definition by adding members like title, description, thumbnail etc.
2. Complete the buildURL() method. This depends on the URL for the API, authentication method, batching in terms of page numbers etc.
3. Complete the code to fetch the image. This is in the recyclerview adapter. The template creates a [NetworkImage](https://github.com/google/volley/blob/master/src/main/java/com/android/volley/toolbox/NetworkImageView.java) in the layout and creates a [Butterknife](http://jakewharton.github.io/butterknife/) injection entry for it. You need to call the [setImageUrl()](https://github.com/google/volley/blob/536c1b741d18395a8aa041de484f3dc46fb57692/src/main/java/com/android/volley/toolbox/NetworkImageView.java#L76) method for this image in order to load the image from the network. If needed, specify the default and error images too.
4. In case you are asked to show a more detailed view after user clicks a row in the list, you should create an activity that gets the details from the intent data and renders the details on the screen. E.g. for a movie it could show a bigger poster, show the year of release, show full credits and so on. Now launch this activity in the click handler. Make sure you pass all the data in the intent or create a cache entry and pass the key to the cache in the intent. That will take care of the detailed view.


