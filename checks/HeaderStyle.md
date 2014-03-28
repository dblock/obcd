HeaderStyle
===========

Checks that the header style of an Objective-C .h, .m or .pch file conforms to the following format.

``` objc
//
//  Valid.h
//  Artsy
//
//  Created by Daniel Doubrovkine on 03/28/2014.
//  Copyright (c) 2014 Artsy. All rights reserved.
//
```

#### Example

```
$ obcd --path=spec/fixtures/HeaderStyle/WrongExtension.m find HeaderStyle
WrongExtension.m: 1 violation
 HeaderStyle: line 2: Filename extension doesn't match, expected .m, got .h.
Found 1 violation.
```
