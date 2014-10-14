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

- (void)setInsets:(UIEdgeInsets)insets {
	_insets = insets;
	[self resizeHeightToFitText];
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
	CGFloat textWidth = ceilf(frame.size.width) - (self.insets.left + self.insets.right);
	if (self.preferredMaxLayoutWidth > 0.0f) {
		CGFloat maxWidthDiff = ceilf(frame.size.width) - self.preferredMaxLayoutWidth;
		self.preferredMaxLayoutWidth = textWidth - maxWidthDiff;
	}

	CGRect newSize = [self.text boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
											 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
										  attributes:@{NSFontAttributeName : self.font}
											 context:nil];

	frame.size.height = ceilf(newSize.size.height) + self.insets.top + self.insets.bottom + 10.0;
	self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, frame.size.width, frame.size.height);
}


#pragma mark - Private

- (void)initialize {
	self.verticalTextAlignment = IPInsetLabelVerticalTextAlignmentMiddle;
	self.insets = UIEdgeInsetsZero;
}


@end
