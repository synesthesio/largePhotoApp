# largePhotoApp


Hello and Welcome to the LargePhotoApp, 


Instructions

1.Clone repository from GitHub. In Terminal: "git clone git@github.com:synesthesio/largePhotoApp.git"
2. In Terminal: "pod install" 
3. In Terminal: "open largePhotoApp.xcworkspace"
4. Run

Caveats:
Images are downloaded asynchronously on a background GCD queue and persisted via a binary data attribute on an entity in a Core Data model. Deleting an image in the GalleryViewController removes the image data from the persistent store, so to reset image store, select "Simulator">"Reset Content and Settings..."






CocoaPods/Third Party Libraries used are strictly for testing purposes. These include Specta, Expecta, & OHHTTPStubs. 


