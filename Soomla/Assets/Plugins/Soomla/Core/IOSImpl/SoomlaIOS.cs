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
using System.Runtime.InteropServices;

namespace Soomla {

	public static class SoomlaIOS {
#if UNITY_IOS && !UNITY_EDITOR
		[DllImport ("__Internal")]
		private static extern void soomla_SetLogDebug(bool debug);
		[DllImport ("__Internal")]
		private static extern void soomla_Init(string secret);
		
		
		/// <summary>
		/// Initializes the SOOMLA SDK.
		/// </summary>
		public static bool Initialize() {
			soomla_SetLogDebug(CoreSettings.DebugMessages);
			soomla_Init(CoreSettings.SoomlaSecret);
			return true;
		}
#endif
	}
}
