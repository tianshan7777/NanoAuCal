package tianshan.com.nanoparticalcalculator;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;

import java.text.DecimalFormat;

public class SmallDiameterCalActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_small_diameter_cal);
    }

    private void showAlert() {
        String title = getString(R.string.alert_title);
        String message = getString(R.string.dia_alert);
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
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

    private double calculateEq11(double ratio) {
        double diameter = Math.exp(3.55 * ratio - 3.11);

        return diameter;
    }

    public void onCalculateSmallDia() {        //get input from user
        double diameter = 0;
        EditText editText = (EditText) findViewById(R.id.editText);
        String input = editText.getText().toString();
        //calclate the small diameter
        if (input.equals("")) {
            showAlert();
        } else {
            double ratio = Double.parseDouble(input);
            diameter = calculateEq11(ratio);
            TextView result = (TextView) findViewById(R.id.smallDia_result);
            DecimalFormat form = new DecimalFormat("0.00");
            result.setText(form.format(diameter)+" nm");
        }

    }

}
