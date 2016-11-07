using Toybox.Application as App;

var count1 = 5;
var timersRunning = false;
var updateTimer;
var delegate;

class RandomWidgetApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    //! onStart() is called on application start up
    function onStart() 
    {
    	updateTimer = new Timer.Timer();	
    	delegate = new RandomWidgetDelegate( );
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() 
    {
    	var view;
    	view = new RandomWidgetNumberView( true );
    	
        return [ view , delegate ];
    }

}