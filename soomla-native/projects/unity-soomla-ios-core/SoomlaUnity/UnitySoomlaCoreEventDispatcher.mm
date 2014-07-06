#import "Soomla.h"
#import "UnitySoomlaCoreEventDispatcher.h"
#import "SoomlaEventHandling.h"
#import "Reward.h"
#import "SoomlaUtils.h"

extern "C" {
    void soomlaCore_Init() {
        [UnitySoomlaCoreEventDispatcher initialize];
    }
}

@implementation UnitySoomlaCoreEventDispatcher

+ (void)initialize {
    static UnitySoomlaCoreEventDispatcher* instance = nil;
    if (!instance) {
        instance = [[UnitySoomlaCoreEventDispatcher alloc] init];
    }
}

- (id) init {
    if (self = [super init]) {
//        [SoomlaEventHandling observeAllEventsWithObserver:self withSelector:@selector(handleEvent:)];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleEvent:) name:EVENT_REWARD_GIVEN object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleEvent:) name:EVENT_REWARD_GIVEN object:nil];
    }
    
    return self;
}

- (void)handleEvent:(NSNotification*)notification{
    
	if ([notification.name isEqualToString:EVENT_REWARD_GIVEN]) {
        NSDictionary* userInfo = [notification userInfo];
        Reward* reward = [userInfo objectForKey:DICT_ELEMENT_REWARD];
        NSString* rewardJson = [SoomlaUtils dictToJsonString:[reward toDictionary]];
        UnitySendMessage("CoreEvents", "onRewardGiven", [rewardJson UTF8String]);
	}
	else if ([notification.name isEqualToString:EVENT_REWARD_TAKEN]) {
        NSDictionary* userInfo = [notification userInfo];
        Reward* reward = [userInfo objectForKey:DICT_ELEMENT_REWARD];
        NSString* rewardJson = [SoomlaUtils dictToJsonString:[reward toDictionary]];
        UnitySendMessage("CoreEvents", "onRewardTaken", [rewardJson UTF8String]);
	}
}

@end
