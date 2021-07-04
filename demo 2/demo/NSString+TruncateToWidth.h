//
//  NSString+TruncateToWidth.h
//  demo
//
//  Created by pengshengsong on 2021/7/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TruncateToWidth)
//- （NSString *）stringByTruncatingAtString:(NSString *)string toWidth：（CGFloat）width withFont:(UIFont *)font;

- (NSString *)stringByTruncatingAtString:(NSString *)string width:(CGFloat)width numberOfLines:(NSInteger) numberOfLines font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
