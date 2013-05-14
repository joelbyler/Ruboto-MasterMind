package com.joelbyler.mastermind.ruboto;

import android.os.Bundle;
import android.preference.PreferenceActivity;

public class MasterMindPreferencesActivity extends PreferenceActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.preferences);
    }
}
