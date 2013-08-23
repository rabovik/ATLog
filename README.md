
# @ ATLog
Usual logging with `NSLog` is quite boring because you need to convert all structures to `NSString` and use a correct specifier for each argument:

```objective-c
NSLog(@"Frame = %@", NSStringFromCGRect(view.frame));
NSLog(@"π = %f", 3.14f);
```

`ATLog` macro uses one universal specifier `%@` for all types and automatically converts all arguments to `NSString` objects:

```objective-c
ATLog(@"Frame = %@", view.frame); // No need for NSStringFromCGRect 
ATLog(@"π = %@", 3.14f); // One '%@' specifier for all argument types
```

## ATConcatLog

`ATConcatLog` macro uses arguments concatenation instead of specifiers replacement _(like in dynamically-typed languages)_:

```objective-c
ATConcatLog(@"π=", 3.14f, @"; Σ=", 13); // π=3.140000; Σ=13
```

## Supported types
For the full list of automatically-converted types see [tests][tests]. Here are some examples:

```objective-c
ATConcatLog(@"\n RootViewController: ",     self.window.rootViewController,  
            @"\n Frame: ",                  self.window.frame,               
            @"\n Center: ",                 self.window.center,              
            @"\n Transform: ",              self.window.transform,           
            @"\n Alignment rect insects: ", self.window.alignmentRectInsets, 
            @"\n Is keyWindow: ",           self.window.keyWindow);          
```
```
RootViewController: (nil)
Frame: {{0, 0}, {320, 568}}
Center: {160, 284}
Transform: [1, 0, 0, 1, 0, 0]
Alignment rect insects: {0, 0, 0, 0}
Is keyWindow: YES
```

```objective-c
ATLog(@"%@", self.window.clearsContextBeforeDrawing); // YES
ATLog(@"%@", (bool)true);                             // true
ATLog(@"%@", NULL);                                   // (NULL)
```

## ATLogEach
Another macro for easy logging. Each argument is logged in a separate line:

```objective-c
ATLogEach(@"Window properties:",
          self.window.frame,
          self.window.center,
          self.window.keyWindow);
```

```
0) Window properties:
1) {{0, 0}, {320, 568}}
2) {160, 284}
3) YES
```

## ATPrettyLog
By default `ATLog` redirects its output to `ATPrettyLog` macro which produces nicer and more informative output than `NSLog`:
```objective-c
NSLog(@"NSLog produces not very useful output.");
ATPrettyLog(@"ATPrettyLog prints method name and line number.");
ATLog(@"ATLog uses ATPrettyLog by default.")
``` 
```
2013-08-22 23:14:16.258 Example[66227:c07] NSLog produces not very useful output.
23:14:16.261 -[AppDelegate logExample] [Line 20] ATPrettyLog prints method name and line number.
23:14:16.261 -[AppDelegate logExample] [Line 21] ATLog uses ATPrettyLog by default.
```

#### Redirecting ATLog output
You can change this default behavior by defining a `ATLog_OUTPUT` macro _**before**_ importing `ATLog.h` file. Here are some examples for using `NSLog` or [CocoaLumberjack][CocoaLumberjack] instead of ATPrettyLog:

###### Redirect to NSLog:
```objective-c
#define ATLog_OUTPUT(fmt, args...) NSLog(fmt,args)
#import "ATLog.h"

ATLog(@"I use NSLog now.");
```

###### Redirect to CocoaLumberjack:
```objective-c
#define ATLog_OUTPUT(fmt, args...) DDLogVerbose(fmt,args)
#import "ATLog.h"

ATLog(@"I use CocoaLumberjack now.");
```


## CocoaPods
Add `ATLog` to your _Podfile_.

## Requirements
* iOS 5.0+
* ARC

## Author
Yan Rabovik ([@rabovik][twitter] on twitter)

## License
MIT License.

[twitter]: https://twitter.com/rabovik
[tests]: https://github.com/rabovik/ATLog/blob/master/Example%20%26%20Tests/ATLogTests/ATStringTests.m#L20
[CocoaLumberjack]: https://github.com/robbiehanson/CocoaLumberjack
