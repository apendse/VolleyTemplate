# VolleyTemplate
Android Studio template for quickly creating a Volley based networking app. Many times, in interviews, you are asked to create a list of items fetched from the network. This template helps you create a solution quickly. Saves you a lot of boiler plate code.

You need to copy this file to the location where Android Studio stores its templates. This location depends on the operating system you are using. e.g. on my MacBook, it is "/Applications/Android Studio.app/Contents/plugins/android/lib/templates".

This template creates a fragment with a recyclerview. It assumes that you are going to fetch data from the network as a list of things e.g. movies, stocks, employees, photos and so on. You need the following steps to create a working solution
1. Complete the object definition by adding members like title, description, thumbnail etc.
2. Complete the buildURL() method. This depends on the URL for the API, authentication method, batching in terms of page numbers etc.
3. Complete the code to fetch the image. This is in the recyclerview adapter. The template creates a [NetworkImage] (https://github.com/google/volley/blob/master/src/main/java/com/android/volley/toolbox/NetworkImageView.java) in the layout and creates a Butterknife injection entry for it. You need to call the [setImageUrl](https://github.com/google/volley/blob/536c1b741d18395a8aa041de484f3dc46fb57692/src/main/java/com/android/volley/toolbox/NetworkImageView.java#L76) for this image. If needed, specify the default and error images too.



