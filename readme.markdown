lummox-nscollection-extensions
=======================
*Version 1.0*

A collection of useful functionality built on top of Foundation collections: NSDictionary, NSArray, NSSet, 
and their mutable versions.

Some of this overlaps with stuff offered by BlocksKit, among other libraries.

Examples
---------
    // Safe accessors
    NSString *stringId = [dictionary lmx_stringForKey:@"id"]; // Returns nil if the key isn't there, or the value isn't a string.
    MyClass *myObject = [dictionary lmx_objectForKey:@"key" ofClass:[MyClass class]];

    // Mapping
    NSDictionary *addedBirds = [dictionary lmx_dictionaryWithMapping:^(NSString *key, NSString *value) {
            return @[[key stringByAppendingString:@"bird"], [value stringByAppendingString:@"bird"]];
        }];

Setup Instructions
------------------
The recommended way is to install via Cocoapods.

It uses a private repo, which you can add to your pods installation like this:
pod repo add lummox-podrepo https://github.com/mbusheikin/lummox-podrepo.git

Add into your Podfile:
pod 'lummox-nscollection-extensions'

Then run:
pod update (or pod install)


MIT License
-----------
    Copyright (c) 2013 Charles Scalesse.

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
