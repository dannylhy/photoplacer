package com.example.myfirstapp;



import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends Activity {
	public final static String EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    /** Called when the user clicks the GT Campus Map button */
    public void mapActivity(View view) {
    	// Do something is response to button
    	Intent intent = new Intent(this, MapActivity.class);
    	//EditText editText = (EditText) findViewById(R.id.edit_message);
    	//String message = "GTmyMusic Test";
    	//intent.putExtra(EXTRA_MESSAGE, message);
    	startActivity(intent);
    }
    
    /** Called when the user clicks the Photo Wishlist button */
    public void wishlistActivity(View view) {
    	// Do something is response to button
    	Intent intent = new Intent(this, WishlistActivity.class);
    	//EditText editText = (EditText) findViewById(R.id.edit_message);
    	//String message = "GTmyMusic Test";
    	//intent.putExtra(EXTRA_MESSAGE, message);
    	startActivity(intent);
    }
    
    /** Called when the user clicks the Take a Photo button */
    public void photoTakeActivity(View view) {
    	// Do something is response to button
    	Intent intent = new Intent(this, PhotoTakeActivity.class);
    	//EditText editText = (EditText) findViewById(R.id.edit_message);
    	//String message = "GTmyMusic Test";
    	//intent.putExtra(EXTRA_MESSAGE, message);
    	startActivity(intent);
    }
    
    /** Called when the user clicks the Login button */
    public void loginActivity(View view) {
    	// Do something is response to button
    	//Intent intent = new Intent(this, LoginActivity.class);
    	Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://login.gatech.edu/cas/login?service=http%3A%2F%2Fdev.m.gatech.edu%2Flogin%2Fprivate%3Furl%3Dhttp%3A%2F%2Fdev.m.gatech.edu%2Fd%2Fdlee399%2Fw%2Fphotoplacer%2Fc%2Fmain.html%26sessionTransfer%3Dwindow"));
		startActivity(myIntent);
    	//startActivity(intent);
    }
    
        
 }
    


    

    
    

