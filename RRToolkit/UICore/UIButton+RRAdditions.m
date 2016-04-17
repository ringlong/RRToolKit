//
//  UIButton+RRAdditions.m
//  RRToolkit
//
//  Created by Ryan on 14-6-12.
//  Copyright (c) 2014年 Ryan. All rights reserved.
//

#import "UIButton+RRAdditions.h"

@implementation UIButton (RRAdditions)

+ (instancetype)buttonWithFrame:(CGRect)frame
                           type:(UIButtonType)type
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                      titleFont:(UIFont *)font
                          image:(UIImage *)image
                backgroundImage:(UIImage *)backgroundImage
                       forState:(UIControlState)state
                         target:(id)target
                         action:(SEL)action
               forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [[self class] buttonWithType:type];
    button.frame = frame;
    if (title) {
        [button setTitle:title forState:state];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:state];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (image) {
        [button setImage:image forState:state];
    }
    if (backgroundImage) {
        [button setBackgroundImage:backgroundImage forState:state];
    }
    [button addTarget:target action:action forControlEvents:controlEvents];
    return button;
}

- (void)addTitle:(NSString *)title
      titleColor:(UIColor *)titleColor
           image:(UIImage *)image
 backgroundImage:(UIImage *)backgroundImage
        forState:(UIControlState)state
{
    if (title) {
        [self setTitle:title forState:state];
    }
    if (titleColor) {
        [self setTitleColor:titleColor forState:state];
    }
    if (image) {
        [self setImage:image forState:state];
    }
    if (backgroundImage) {
        [self setBackgroundImage:backgroundImage forState:state];
    }
}


#pragma mark - Public
- (void)setTitleImageAligment:(UIButtonTitleImageAlignment)aligment withSpace:(CGFloat)space {
  switch (aligment) {
	case UIButtonTitleImageAlignmentRightLeft:
	  [self imageTitleHorizontalAlignmentWithSpace:space];
	  break;
	case UIButtonTitleImageAlignmentLeftRight:
	  [self titleImageHorizontalAlignmentWithSpace:space];
	  break;
	case UIButtonTitleImageAlignmentTopBottom:
	  [self titleImageVerticalAlignmentWithSpace:space];
	  break;
	case UIButtonTitleImageAlignmentBottomTop:
	  [self imageTitleHorizontalAlignmentWithSpace:space];
	  break;
  }
}

#pragma mark - Private

- (void)titleImageHorizontalAlignmentWithSpace:(CGFloat)space {
  [self resetEdgeInsets];
  [self setNeedsLayout];
  [self layoutIfNeeded];
  
  CGRect contentRect = [self contentRectForBounds:self.bounds];
  CGSize titleSize = [self titleRectForContentRect:contentRect].size;
  CGSize imageSize = [self imageRectForContentRect:contentRect].size;
  
  self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space);
  self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width);
  self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + space, 0, -titleSize.width - space);
}

- (void)imageTitleHorizontalAlignmentWithSpace:(CGFloat)space {
  [self resetEdgeInsets];
  self.titleEdgeInsets = UIEdgeInsetsMake(0, space, 0, -space);
  self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, space);
}

- (void)titleImageVerticalAlignmentWithSpace:(CGFloat)space {
  [self verticalAlignmentWithTitleTop:YES space:space];
}

- (void)imageTitleVerticalAlignmentWithSpace:(CGFloat)space {
  [self verticalAlignmentWithTitleTop:NO space:space];
}

- (void)resetEdgeInsets {
  self.contentEdgeInsets = UIEdgeInsetsZero;
  self.imageEdgeInsets = UIEdgeInsetsZero;
  self.titleEdgeInsets = UIEdgeInsetsZero;
}

- (void)verticalAlignmentWithTitleTop:(BOOL)isTop space:(CGFloat)space {
  [self resetEdgeInsets];
  [self setNeedsLayout];
  [self layoutIfNeeded];
  
  CGRect contentRect = [self contentRectForBounds:self.bounds];
  CGSize titleSize = [self titleRectForContentRect:contentRect].size;
  CGSize imageSize = [self imageRectForContentRect:contentRect].size;
  
  float halfWidth = (titleSize.width + imageSize.width) / 2;
  float halfHeight = (titleSize.height + imageSize.height) / 2;
  
  float topInset = MIN(halfHeight, titleSize.height);
  float leftInset = (titleSize.width - imageSize.width) > 0 ? (titleSize.width - imageSize.width) / 2 : 0;
  float bottomInset = (titleSize.height - imageSize.height) > 0 ? (titleSize.height - imageSize.height) / 2 : 0;
  float rightInset = MIN(halfWidth, titleSize.width);
  
  if (isTop) {
	self.titleEdgeInsets = UIEdgeInsetsMake(-titleSize.height - space, - halfWidth, imageSize.height + space, halfWidth);
	self.contentEdgeInsets = UIEdgeInsetsMake(topInset + space, leftInset, -bottomInset, -rightInset);
  } else {
	self.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height + space, - halfWidth, -titleSize.height - space, halfWidth);
	self.contentEdgeInsets = UIEdgeInsetsMake(-bottomInset, leftInset, topInset + space, -rightInset);
  }
}

@end
