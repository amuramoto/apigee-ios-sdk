/*
 * Copyright 2014 Apigee Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "ApigeeHTTPResult.h"
#import "ApigeeJsonUtils.h"

@implementation ApigeeHTTPResult

- (id) object {
    if (!_object && !_error) {
        NSError *error;
        _object = [ApigeeJsonUtils decodeData:_data error:&error];
        _error = error;
        if (_error) {
            NSLog(@"JSON ERROR: %@", [error description]);
        }
    }
    return _object;
}

- (NSString *) UTF8String {
    return [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
}

@end