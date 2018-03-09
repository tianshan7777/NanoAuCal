package tianshan.com.nanoparticalcalculator;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.View;
import android.widget.Button;

import java.net.URL;

public class LinkActivity extends AppCompatActivity {

    String web = "http://www.ntk-thanh.co.uk/";
    String paper = "http://pubs.acs.org/doi/pdf/10.1021/ac0702084";
    String info = "http://pubs.acs.org/doi/suppl/10.1021/ac0702084";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_link);
    }

    private void goToUrl(String url){
        Uri uriUrl = Uri.parse(url);
        Intent intent = new Intent(Intent.ACTION_VIEW,uriUrl);
        startActivity(intent);
    }

    public void onPersonalWeb(View view){
        goToUrl(web);
    }

    public void onPaper(View view){
        goToUrl(paper);
    }

    public void onSupportingInfo(View view){
        goToUrl(info);
    }
}

/*
		@Override
		public void onClick(View arg0) {

			Intent intent = new Intent(Intent.ACTION_VIEW,
			     Uri.parse("http://www.mkyong.com"));
			startActivity(intent);

		}
 */
