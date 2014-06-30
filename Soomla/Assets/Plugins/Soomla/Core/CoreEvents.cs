/// Copyright (C) 2012-2014 Soomla Inc.
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///      http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

using UnityEngine;
using System;
using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace Soomla {

	/// <summary>
	/// This class provides functions for event handling.
	/// </summary>
	public class CoreEvents : MonoBehaviour {

		private const string TAG = "SOOMLA CoreEvents";

		private static CoreEvents instance = null;

		/// <summary>
		/// Initializes game state before the game starts.
		/// </summary>
		void Awake(){
			if(instance == null){ 	// making sure we only initialize one instance.
				instance = this;
				GameObject.DontDestroyOnLoad(this.gameObject);
			} else {				// Destroying unused instances.
				GameObject.Destroy(this.gameObject);
			}
		}

		/// <summary>
		/// Will be called when a reward was given to the user.
		/// </summary>
		/// <param name="message">Will contain a JSON representation of a <c>Reward</c> and a flag saying if it's a Badge or not.</param>
		public void onRewardGiven(string message) {
			SoomlaUtils.LogDebug(TAG, "SOOMLA/UNITY onRewardGiven:" + message);
			
			JSONObject rewardObj = new JSONObject(message);
			Reward reward = Reward.fromJSONObject(rewardObj);
			CoreEvents.OnRewardGiven(reward);
		}

		/// <summary>
		/// Will be called when a reward was given to the user.
		/// </summary>
		/// <param name="message">Will contain a JSON representation of a <c>Reward</c> and a flag saying if it's a Badge or not.</param>
		public void onRewardTaken(string message) {
			SoomlaUtils.LogDebug(TAG, "SOOMLA/UNITY onRewardTaken:" + message);
			
			JSONObject rewardObj = new JSONObject(message);
			Reward reward = Reward.fromJSONObject(rewardObj);
			CoreEvents.OnRewardTaken(reward);
		}


		public delegate void Action();

		public static Action<Reward> OnRewardGiven = delegate {};
		public static Action<Reward> OnRewardTaken = delegate {};

	}
}
