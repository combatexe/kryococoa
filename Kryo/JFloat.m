// ======================================================================================
// Copyright (c) 2013, Christian Fruth, Boxx IT Solutions e.K.
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

#import "JFloat.h"

@implementation JFloat

+ (instancetype)floatWithValue:(float)value
{
	return [[JFloat alloc] initWithValue:value];
}

- (id)initWithValue:(float)value
{
	self = [super init];
	
	if (self != nil)
	{
		_value = value;
	}
	
	return self;
}

- (bool)boolValue
{
	return _value > 0.0f;
}

- (SInt8)byteValue
{
	return _value;
}

- (SInt16)shortValue
{
	return _value;
}

- (SInt32)intValue
{
	return _value;
}

- (SInt64)longValue
{
	return _value;
}

- (float)floatValue
{
	return _value;
}

- (double)doubleValue
{
	return _value;
}

- (BOOL)isEqual:(id)anObject
{
	if (anObject == self)
	{
		return YES;
	}
	
	if (anObject == nil)
	{
		return NO;
	}
	
	if (![anObject isKindOfClass:[self class]])
	{
		return NO;
	}
	
    return [self internalIsEqualToFloat:anObject];
}

- (BOOL)isEqualToFloat:(JFloat *)aFloat
{
	if (aFloat == self)
	{
		return YES;
	}
	
	if (aFloat == nil)
	{
		return NO;
	}
	
    return [self internalIsEqualToFloat:aFloat];
}

- (BOOL)internalIsEqualToFloat:(JFloat *)aFloat
{
	return _value == aFloat->_value;
}

- (NSUInteger)hash
{
	NSUInteger hash = 3511;
	UInt32 intValue = *(UInt32 *)&_value;
	hash = 541 * hash + intValue;
	return hash;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%f", _value];
}

- (NSString *)debugDescription
{
	return [self description];
}

- (id)copyWithZone:(NSZone *)zone
{
	return [JFloat floatWithValue:_value];
}

+ (NSString *)serializingAlias
{
	return @"java.lang.Float";
}

+ (BOOL)primitiveType
{
	return YES;
}

@end
