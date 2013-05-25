package com.joelbyler.mastermind.ruboto;

import android.os.Bundle;

public class MasterMindPreferencesActivity extends org.ruboto.EntryPointActivity {
	public void onCreate(Bundle bundle) {
		getScriptInfo().setRubyClassName(getClass().getSimpleName());
	    super.onCreate(bundle);
	}
}
