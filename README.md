*This project is a part of The [SOOMLA](http://project.soom.la) Framework which is a series of open source initiatives with a joint goal to help mobile game developers do more together. SOOMLA encourages better game designing, economy modeling and faster development.*

soomla-unity3d-core
===============
The core module is currently included inside the [unity3d-store](https://github.com/soomla/unity3d-store) module.  When importing the *unity3d-store* package, add the `CoreEvents` prefab to your earliest loading scene.  This will ensure the core module is initialized, no need to add any code.  This core library holds common features and utilities used by all other modules of the SOOMLA framework.

It includes:
* Native bridges for on-device storage.
* `SoomlaEntity` - the base class from which all SOOMLA domain objects derive
* Reward domain objects and events - used to grant your users rewards.
* Utilities for logging and JSON manipulation.
* Utilities for the SOOMLA settings panel inside Unity.
* Utilities for platform specific post-build procedures:
  * Android - Manifest manipulation tools
  * iOS - XCode project manipulation tools

SOOMLA modules internally use these features, though we encourage you to use them for your own needs as well.  The settings panel utilities and post-build utilities should be used when creating a SOOMLA plugin for Unity.


Contribution
---

We want you!

Fork -> Clone -> Implement —> Insert Comments -> Test -> Pull-Request. We have great RESPECT for contributors.

Code Documentation
---

We follow strict code documentation conventions. If you would like to contribute please read our [Documentation Guidelines](https://github.com/soomla/unity3d-store/blob/master/documentation.md) and follow them. Clear, consistent  comments will make our code easy to understand.

SOOMLA, Elsewhere ...
---

+ [Framework Page](http://project.soom.la/)
+ [On Facebook](https://www.facebook.com/pages/The-SOOMLA-Project/389643294427376).
+ [On AngelList](https://angel.co/the-soomla-project)

License
---
Apache License. Copyright (c) 2012-2014 SOOMLA. http://project.soom.la
+ http://opensource.org/licenses/Apache-2.0
