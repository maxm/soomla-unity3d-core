#import "Soomla.h"
#import "UnityCommons.h"
#import "Reward.h"
#import "SequenceReward.h"
#import "RewardStorage.h"
#import "SoomlaUtils.h"

char* AutonomousStringCopy (const char* string)
{
    if (string == NULL)
       return NULL;

    char* res = (char*)malloc(strlen(string) + 1);
    strcpy(res, string);
    return res;
}

extern "C"{
	

    void rewardStorage_SetRewardStatus(const char* sRewardJson, bool give, bool notify) {
        Reward* reward = nil;
        if(sRewardJson) {
            NSString* rewardJson = [NSString stringWithUTF8String:sRewardJson];
            reward = [[Reward alloc] initWithDictionary:[SoomlaUtils jsonStringToDict:rewardJson]];
        }
        
        [RewardStorage setStatus:give forReward:reward andNotify:notify];
    }
    
    bool rewardStorage_IsRewardGiven(const char* sRewardJson) {
        Reward* reward = nil;
        if(sRewardJson) {
            NSString* rewardJson = [NSString stringWithUTF8String:sRewardJson];
            reward = [[Reward alloc] initWithDictionary:[SoomlaUtils jsonStringToDict:rewardJson]];
        }
        
        return [RewardStorage isRewardGiven:reward];
    }
    

    int rewardStorage_GetLastSeqIdxGiven(const char* sSeqRewardJson) {
        SequenceReward* seqReward = nil;
        if(sSeqRewardJson) {
            NSString* seqRewardJson = [NSString stringWithUTF8String:sSeqRewardJson];
            seqReward = [[SequenceReward alloc] initWithDictionary:[SoomlaUtils jsonStringToDict:seqRewardJson]];
        }
        
        return [RewardStorage getLastSeqIdxGivenForReward:seqReward];
    }

    void rewardStorage_SetLastSeqIdxGiven(const char* sSeqRewardJson, int idx) {
        SequenceReward* seqReward = nil;
        if(sSeqRewardJson) {
            NSString* seqRewardJson = [NSString stringWithUTF8String:sSeqRewardJson];
            seqReward = [[SequenceReward alloc] initWithDictionary:[SoomlaUtils jsonStringToDict:seqRewardJson]];
        }
        
        return [RewardStorage setLastSeqIdxGiven:idx ForReward:seqReward];
    }    
}