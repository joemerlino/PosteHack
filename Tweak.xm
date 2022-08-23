#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DAAlertActionStyle) {
    DAAlertActionStyleDefault = 0,
    DAAlertActionStyleCancel,
    DAAlertActionStyleDestructive
};

@interface DAAlertAction : NSObject <NSCopying>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) DAAlertActionStyle style;
@property (nonatomic, copy) void (^handler)(void);

+ (instancetype)actionWithTitle:(NSString *)title style:(DAAlertActionStyle)style handler:(void (^)(void))handler;

@end

%hook DAAlertController
+ (void)showAlertViewInViewController:(UIViewController *)viewController withTitle:(NSString *)title message:(NSString *)message actions:(NSArray *)actions numberOfTextFields:(NSUInteger)numberOfTextFields textFieldsConfigurationHandler:(void (^)(NSArray *textFields))configurationHandler validationBlock:(BOOL (^)(NSArray *textFields))validationBlock{
	if([message containsString:@"alterazioni rispetto a quello originale"]){
		for (DAAlertAction *action in actions) {
            if (action.handler) {
                action.handler();
            }
        }
	}
    else{
        %orig;
    }
}
%end