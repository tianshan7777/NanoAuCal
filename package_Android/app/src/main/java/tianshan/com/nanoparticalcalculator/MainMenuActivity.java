package tianshan.com.nanoparticalcalculator;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

public class MainMenuActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_menu);
    }

    public void onConcentrationCal(View view){
        Intent intent = new Intent(this,ConcentrationCalculateActivity.class);
        startActivity(intent);
    }

    public void onDiameterCal(View view){
        Intent intent = new Intent(this,DiameterCalculateActivity.class);
        startActivity(intent);
    }

    public void onSupportingInfo(View view){
        Intent intent = new Intent(this, LinkActivity.class);
        startActivity(intent);
    }
    public void onAbout(View view){
        Intent intent = new Intent(this, AboutThisAppActivity.class);
        startActivity(intent);
    }

}
