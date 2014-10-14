//
//  IPInsetLabel.h
//  Instapaper
//
//  Created by Marco Arment on 7/23/11.
//  Copyright 2011 Instapaper LLC, released to the public domain.
//

#import <UIKit/UIKit.h>

typedef enum {
	/** Aligns the text vertically at the top in the label (the default). */
	IPInsetLabelVerticalTextAlignmentTop = UIControlContentVerticalAlignmentTop,

	/** Aligns the text vertically in the center of the label. */
	IPInsetLabelVerticalTextAlignmentMiddle = UIControlContentVerticalAlignmentCenter,

	/** Aligns the text vertically at the bottom in the label. */
	IPInsetLabelVerticalTextAlignmentBottom = UIControlContentVerticalAlignmentBottom
} IPInsetLabelVerticalTextAlignment;

@interface IPInsetLabel : UILabel
@property (nonatomic, assign) IPInsetLabelVerticalTextAlignment verticalTextAlignment;
@property (nonatomic, assign) UIEdgeInsets insets;
- (void)resizeHeightToFitText;
@end
