//
//  IPInsetLabel.m
//  Instapaper
//
//  Created by Marco Arment on 7/23/11.
//  Copyright 2011 Instapaper LLC, released to the public domain.
//

#import "IPInsetLabel.h"

@implementation IPInsetLabel


#pragma mark - Accessors

@synthesize verticalTextAlignment = _verticalTextAlignment;
@synthesize insets = _insets;

- (void)setVerticalTextAlignment:(IPInsetLabelVerticalTextAlignment)verticalTextAlignment {
	_verticalTextAlignment = verticalTextAlignment;
	[self setNeedsLayout];
}

- (void)setTextEdgeInsets:(UIEdgeInsets)insets {
	_insets = insets;
	[self setNeedsLayout];
}


#pragma mark - UIView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if ((self = [super initWithCoder:aDecoder])) {
		[self initialize];
	}
	return self;
}

- (id)initWithFrame:(CGRect)aFrame {
	if ((self = [super initWithFrame:aFrame])) {
		[self initialize];
	}
	return self;
}


#pragma mark - UILabel

- (void)drawTextInRect:(CGRect)rect {
	rect = UIEdgeInsetsInsetRect(rect, self.insets);

	if (self.verticalTextAlignment == IPInsetLabelVerticalTextAlignmentTop) {
		CGSize sizeThatFits = [self sizeThatFits:rect.size];
		rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, sizeThatFits.height);
	} else if (self.verticalTextAlignment == IPInsetLabelVerticalTextAlignmentBottom) {
		CGSize sizeThatFits = [self sizeThatFits:rect.size];
		rect = CGRectMake(rect.origin.x, rect.origin.y + (rect.size.height - sizeThatFits.height), rect.size.width, sizeThatFits.height);
	}

	[super drawTextInRect:rect];
}

- (void)resizeHeightToFitText
{
    CGRect frame = [self bounds];
    CGFloat textWidth = frame.size.width - (self.insets.left + self.insets.right);

    CGRect newSize = [self.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];

    frame.size.height = newSize.size.height + self.insets.top + self.insets.bottom;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame.size.width, frame.size.height);
}


#pragma mark - Private

- (void)initialize {
	self.verticalTextAlignment = IPInsetLabelVerticalTextAlignmentMiddle;
	self.insets = UIEdgeInsetsZero;
}


@end
