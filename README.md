# angular-elm-integration

This repository contains POC of integration between Elm and Angular. 

To run this example, you should be ready to start any Elm (v. 0.18) app.

# Running example
Inside root directory of angular-elm-integration repository run following command:
```
elm-make src/Main.elm --output=main.js
```
Elm should ask you for downloading some dependencies, after that you should be able to manually run example by opening index.html with your browser. There is no need for any server. If you really need it, check it:
https://www.npmjs.com/package/http-server

# About example

In this example i'm showing how to use some API that is currently not available natively in Elm lang. 

Function *getUserEmailFromDB* is a mock of some API that is really needed in your project, but you cannot find that API in elm packages.

You can use Ports to communicate with JavaScript. Also, you can use Ports inside frameworks like Angular!

Check out **src/Main.elm** and **app.js** to see how easy is that.