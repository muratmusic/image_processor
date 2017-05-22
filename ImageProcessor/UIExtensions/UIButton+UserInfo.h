//
//  UIButton+UserInfo.h
//

#import <UIKit/UIKit.h>

/*
 UIButton class extension.
 Used for passing additional user info dictionary.
*/
@interface UIButton (UserInfo)

@property(nonatomic, retain) NSDictionary * userInfo;

@end
