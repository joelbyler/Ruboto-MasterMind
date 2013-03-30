package com.joelbyler.mastermind.ruboto;

import android.os.Bundle;

public class MasterMindRubotoActivity extends org.ruboto.EntryPointActivity {
	public void onCreate(Bundle bundle) {
		getScriptInfo().setRubyClassName(getClass().getSimpleName());
	    super.onCreate(bundle);
	}
}
