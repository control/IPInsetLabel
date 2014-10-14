//
//  IPInsetLabel.m
//  Instapaper
//
//  Created by Marco Arment on 7/23/11.
//  Copyright 2011 Instapaper LLC, released to the public domain.
//

#import "IPInsetLabel.h"

@implementation IPInsetLabel
@synthesize insets;

- (void)drawTextInRect:(CGRect)rect
{
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

- (void)resizeHeightToFitText
{
    CGRect frame = [self bounds];
    CGFloat textWidth = frame.size.width - (self.insets.left + self.insets.right);

    CGRect newSize = [self.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];

    frame.size.height = newSize.size.height + self.insets.top + self.insets.bottom;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame.size.width, frame.size.height);
}

@end
