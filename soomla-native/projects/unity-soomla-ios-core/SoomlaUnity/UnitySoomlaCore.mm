#import "Soomla.h"
#import "UnityCommons.h"
#import "Reward.h"
#import "SequenceReward.h"
#import "RewardStorage.h"
#import "SoomlaUtils.h"
#import "UnitySoomlaCoreEventDispatcher.h"
#import "SoomlaConfig.h"

char* AutonomousStringCopy (const char* string)
{
    if (string == NULL)
       return NULL;

    char* res = (char*)malloc(strlen(string) + 1);
    strcpy(res, string);
    return res;
}
extern "C" {
    void soomlaCore_Init(const char* secret, bool debug) {
        LogDebug(@"SOOMLA Unity UnitySoomlaCore", @"Initializing SoomlaEventHandler ...");
        
        DEBUG_LOG = debug;
        [UnitySoomlaCoreEventDispatcher initialize];
        [Soomla initializeWithSecret:[NSString stringWithUTF8String:secret]];
    }

    void rewardStorage_SetRewardStatus(const char* sRewardJson, bool give, bool notify) {
        Reward* reward = nil;
        if(sRewardJson) {
            NSString* rewardJson = [NSString stringWithUTF8String:sRewardJson];
            reward = [Reward fromDictionary:[SoomlaUtils jsonStringToDict:rewardJson]];
        }
        
        [RewardStorage setStatus:give forReward:reward andNotify:notify];
    }
    
    bool rewardStorage_IsRewardGiven(const char* sRewardJson) {
        Reward* reward = nil;
        if(sRewardJson) {
            NSString* rewardJson = [NSString stringWithUTF8String:sRewardJson];
            reward = [Reward fromDictionary:[SoomlaUtils jsonStringToDict:rewardJson]];
        }
        
        return [RewardStorage isRewardGiven:reward];
    }
    

    int rewardStorage_GetLastSeqIdxGiven(const char* sSeqRewardJson) {
        SequenceReward* seqReward = nil;
        if(sSeqRewardJson) {
            NSString* seqRewardJson = [NSString stringWithUTF8String:sSeqRewardJson];
            seqReward = (SequenceReward*)[Reward fromDictionary:[SoomlaUtils jsonStringToDict:seqRewardJson]];
        }
        
        return [RewardStorage getLastSeqIdxGivenForReward:seqReward];
    }

    void rewardStorage_SetLastSeqIdxGiven(const char* sSeqRewardJson, int idx) {
        SequenceReward* seqReward = nil;
        if(sSeqRewardJson) {
            NSString* seqRewardJson = [NSString stringWithUTF8String:sSeqRewardJson];
            seqReward = (SequenceReward*)[Reward fromDictionary:[SoomlaUtils jsonStringToDict:seqRewardJson]];
        }
        
        return [RewardStorage setLastSeqIdxGiven:idx ForReward:seqReward];
    }    
}