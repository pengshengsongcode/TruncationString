//
//  NSString+TruncateToWidth.m
//  demo
//
//  Created by pengshengsong on 2021/7/2.
//

#import "NSString+TruncateToWidth.h"
#define ellipsis @"…"

@implementation NSString (TruncateToWidth)

- (NSString *)stringByTruncatingAtString:(NSString *)string width:(CGFloat)width numberOfLines:(NSInteger) numberOfLines font:(UIFont *)font {
    
    if ([self sizeWithAttributes:@{NSFontAttributeName:font}].width < width || [self rangeOfString:string].location == NSNotFound) {
        return self;
    }
    
    NSDictionary *attr = @{NSFontAttributeName:font};
    NSMutableString *truncatedString = [self mutableCopy];
    
    // origin
    CGFloat originHeight = [truncatedString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.height;
    
    // standard
    NSMutableString *standardString = [NSMutableString string];
    for (NSInteger i = 1; i < numberOfLines; i ++) {
        [standardString appendString:@"\n"];
    }
    CGFloat standardHeight = [standardString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.height;
    
    if (originHeight <= standardHeight) {
        return self;
    }
    
    NSRange range = [truncatedString rangeOfString:string];
    range.length = 1;

    //先处理...
    range.location -= 1;
    [truncatedString replaceCharactersInRange:range withString:ellipsis];
        
    while (range.location > 0) {
        CGFloat tempHeight = [truncatedString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size.height;
        if (tempHeight == standardHeight) {
            break;
        } else {
            range.location -= 1;
            [truncatedString deleteCharactersInRange:range];
        }
    }
    return truncatedString;
}

@end
