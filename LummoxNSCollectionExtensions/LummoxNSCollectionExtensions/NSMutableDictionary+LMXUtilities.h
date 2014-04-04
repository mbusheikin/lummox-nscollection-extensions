//
//  NSMutableDictionary+LMXUtilities.h

//
//  Created by Michael Busheikin on 8/12/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (LMXUtilities)

- (void)lmx_safelySetObject:(id)object forKey:(id)key;

@end
