package com.soomla.core.unity;

import com.soomla.BusProvider;
import com.soomla.events.RewardGivenEvent;
import com.soomla.events.RewardTakenEvent;
import com.squareup.otto.Subscribe;
import com.unity3d.player.UnityPlayer;

public class EventHandler {
    private static EventHandler mLocalEventHandler;

    public static void initialize() {
        mLocalEventHandler = new EventHandler();

    }

    public EventHandler() {
        BusProvider.getInstance().register(this);
    }

    @Subscribe
    public void onRewardGiven(RewardGivenEvent rewardGivenEvent) {
        UnityPlayer.UnitySendMessage("CoreEvents", "onRewardGiven", rewardGivenEvent.Reward.toJSONObject().toString());
    }

    @Subscribe
    public void onRewardGiven(RewardTakenEvent rewardTakenEvent) {
        UnityPlayer.UnitySendMessage("CoreEvents", "onRewardTaken", rewardTakenEvent.Reward.toJSONObject().toString());
    }
}
