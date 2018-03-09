package tianshan.com.nanoparticalcalculator;

import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.app.AlertDialog;
import android.widget.TextView;

import java.text.DecimalFormat;

public class  ConcentrationCalculateActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_concentration_calculate);
    }

    double[] epsilon_values = {
            0, 0, 4.25, 1.49, 36.2, 72.0, 126.0,
            203.0, 307.0, 443.0, 615.0, 827.0,
            1090.0, 1390.0, 1760.0, 2180.0, 2670.0, 3870.0,
            4600.0, 5410.0, 6310.0, 7310.0, 8420.0, 9640.0,
            11000.0, 12400.0, 14000.0, 15800.0, 17600.0, 19600.0,
            21800.0, 24100.0, 26600.0, 29300.0, 32100.0, 35200.0,
            38400.0, 41800.0, 45400.0, 49200.0, 53200.0, 57400.0,
            61800.0, 66500.0, 71300.0, 76500.0, 81800.0, 87400.0,
            93200.0, 99200.0, 106000.0, 112000.0, 119000.0, 126000.0,
            133000.0, 141000.0, 148000.0, 157000.0, 165000.0, 173000.0,
            182000.0, 191000.0, 200000.0, 210000.0, 219000.0, 229000.0,
            240000.0, 250000.0, 261000.0, 271000.0, 282000.0, 293000.0,
            305000.0, 316000.0, 328000.0, 340000.0, 362000.0, 364000.0,
            377000.0, 389000.0, 402000.0, 414000.0, 427000.0, 440000.0,
            453000.0, 465000.0, 478000.0, 491000.0, 504000.0, 517000.0,
            530000.0, 543000.0, 556000.0, 569000.0, 582000.0, 594000.0,
            607000.0, 619000.0, 631000.0, 644000.0
    };

    private boolean checkDia(int diameter){
        if((diameter>2)&&(diameter<100)){
            return true;
        }else{
            String title = getString(R.string.alert_title);
            String message = getString(R.string.con_alert);
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

            return false;
        }
    }

    private void refresh(){
        Button calculate = (Button) findViewById(R.id.calculate);
        calculate.setVisibility(View.VISIBLE);
        //calculate button appears
        TextView con_output = (TextView) findViewById(R.id.con_output);
        con_output.setVisibility(View.GONE);
        //con_output disappears
        TextView con_result = (TextView) findViewById(R.id.con_result);
        con_result.setText("");
        //reset text
        TextView mass_cal = (TextView) findViewById(R.id.mass_cal);
        mass_cal.setVisibility(View.GONE);
        //
        TextView mass_result = (TextView) findViewById(R.id.mass_result);
        mass_result.setText("");
        //
        TextView goldCon_cal = (TextView) findViewById(R.id.goldCon_cal);
        goldCon_cal.setVisibility(View.GONE);
        //
        TextView goldCon_result = (TextView) findViewById(R.id.goldCon_result);
        goldCon_result.setText("");
        //
        Button calAgain = (Button) findViewById(R.id.calAgain);
        calAgain.setVisibility(View.GONE);
    }

    public void onCalculateCon(View view){
        //get input form user
        EditText editText1 = (EditText) findViewById(R.id.con_editText1);
        EditText editText2 = (EditText) findViewById(R.id.con_editText2);
        String text1 = editText1.getText().toString();
        String text2 = editText2.getText().toString();
        int diameter = 0;
        double concentration = 0;
        double mass_per_ml = 0;
        double mol_per_l = 0;
        double optical_density = 0;
        //
        if(text1.equals("")||text2.equals("")){
            checkDia(diameter);
        }
        else {
            diameter = Integer.parseInt(text1);//convert input diameter into integer
            optical_density = Double.parseDouble(text2);
            if (checkDia(diameter)) {
                concentration = concCal(diameter,optical_density);
                mass_per_ml = massCal(concentration, diameter);
                mol_per_l = molesCal(concentration);
                //Calculate concentration, mass and molar concentration
                Button calculate = (Button) findViewById(R.id.calculate);
                calculate.setVisibility(View.GONE);
                //Disappear calculate button
                TextView con_output = (TextView) findViewById(R.id.con_output);
                con_output.setVisibility(View.VISIBLE);
                //con_output appear
                TextView con_result = (TextView) findViewById(R.id.con_result);
                DecimalFormat form1 = new DecimalFormat("0.00");
                con_result.setText(form1.format(concentration));
                // Note that number is rounded to 2.d.p
                TextView mass_cal = (TextView) findViewById(R.id.mass_cal);
                mass_cal.setVisibility(View.VISIBLE);
                //mass_output appears
                TextView mass_result = (TextView) findViewById(R.id.mass_result);
                mass_result.setVisibility(View.VISIBLE);
                DecimalFormat form2 = new DecimalFormat("0.0000");
                mass_result.setText(form2.format(mass_per_ml));
                //mass result
                TextView goldCon_cal = (TextView) findViewById(R.id.goldCon_cal);
                goldCon_cal.setVisibility(View.VISIBLE);
                //
                TextView goldCon_result = (TextView) findViewById(R.id.goldCon_result);
                goldCon_result.setVisibility(View.VISIBLE);
                goldCon_result.setText(form2.format(mol_per_l));
                //
                Button calAgain = (Button) findViewById(R.id.calAgain);
                calAgain.setVisibility(View.VISIBLE);
            }
        }
    }

    public void onCalAgain(View view){
        refresh();
    }

    private double concCal(int diameter, double od){
        double epsilon = epsilon_values[diameter] * Math.pow(10.0,5.0);
        double concentration = (od*(Math.pow(10.0,9.0)))/epsilon;
        return concentration;
    }

    private double massCal(double concentration, int diameter){
        //Calculate the volume (nm^3)
        double volume = Math.pow((diameter/2.0),3.0) * (4/3) * Math.PI;
        //Calculate the mass in (g)
        double mass = 19.32 * volume * Math.pow(10.0, -21.0);
        //Calculate the mass of GNPs(mg/ml)
        double mass_per_ml = concentration * Math.pow(10.0,-9.0) * 6.022 * Math.pow(10.0, 23.0) * mass;

        return mass_per_ml;
    }

    private double molesCal(double concentration){
        double  mol_per_l = concentration * 196.96657 * Math.pow(10, 3) * Math.pow(10, -9) * Math.pow(10, 3);

        return mol_per_l;
    }
}


