// ======================================================================================
// Copyright (c) 2013, Christian Fruth, Boxx IT Solutions e.K.
// Based on Kryo for Java, Nathan Sweet
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice, this list
// of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice, this list
// of conditions and the following disclaimer in the documentation and/or other materials
// provided with the distribution.
// Neither the name of the Boxx IT Solutions e.K. nor the names of its contributors may
// be used to endorse or promote products derived from this software without specific
// prior written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
// SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
// DAMAGE.
// ======================================================================================

#import "KryoException.h"

@implementation KryoException

+ (void)raise:(NSString *)message
{
	[[[KryoException alloc] initWithMessage:message] raise];
}

+ (void)raiseWithFormat:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
	KryoException * ex = [[KryoException alloc] initWithFormat:format arguments:args];
	va_end(args);

	[ex raise];
}

- (id)initWithMessage:(NSString *)message
{
	return [super initWithName:@"KryoException" reason:message userInfo:nil];
}

- (id)initWithFormat:(NSString *)format, ...
{
    va_list args;
    va_start(args, format);
	self = [self initWithFormat:format arguments:args];
	va_end(args);
	
	return self;
}

- (id)initWithFormat:(NSString *)format arguments:(va_list)argList
{
	NSString *reason = [[NSString alloc] initWithFormat:format arguments:argList];
	return [super initWithName:@"KryoException" reason:reason userInfo:nil];
}

@end
