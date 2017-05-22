//
//  UIButton+UserInfo.m
//

#import "UIButton+UserInfo.h"
#import <objc/runtime.h>

@implementation UIButton (UserInfo)

static char UIB_USERINFO_KEY;

@dynamic userInfo;

- (void)setUserInfo:(NSDictionary *)userInfo
{
    objc_setAssociatedObject(self, &UIB_USERINFO_KEY, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)userInfo
{
    return (NSDictionary*)objc_getAssociatedObject(self, &UIB_USERINFO_KEY);
}

@end
