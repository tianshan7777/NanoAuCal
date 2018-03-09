package tianshan.com.nanoparticalcalculator;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.text.DecimalFormat;

public class DiameterCalculateActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_diameter_calculate);
    }

    private void showAlert(){
        String title = getString(R.string.alert_title);
        String message = getString(R.string.dia_alert);
        AlertDialog alertDialog =  new AlertDialog.Builder(this).create();
        alertDialog.setTitle(title);
        alertDialog.setMessage(message);
        alertDialog.setIcon(R.drawable.icon);
        alertDialog.setButton("OK", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                    }
                }
        );
        alertDialog.show();
    }

    private double calculateEqn10(double plasma_reso){
        double diameter = Math.log10((plasma_reso-512)/6.53)/0.0216;

        return diameter;
    }

    public void onCalculateDia(View view){
        EditText text = (EditText) findViewById(R.id.resonance);
        String textInput = text.getText().toString();
        //initialise var
        double plasma_reso = 0;
        double diameter = 0;
        //check null input
        if(textInput.equals("")){
            showAlert();
        }else{
            plasma_reso = Double.parseDouble(textInput);
            diameter = calculateEqn10(plasma_reso);
            if(diameter <= 35) {
                Intent intent = new Intent(this, SmallDiameterCalActivity.class);
                startActivity(intent);
            }
            //show the result
            else {
                TextView result = (TextView) findViewById(R.id.dia_result);
                DecimalFormat form = new DecimalFormat("0.00");
                result.setText(form.format(diameter)+" nm");
            }
        }
    }

}



