using Toybox.WatchUi as Ui;
using Toybox.System as Sys;


class RandomWidgetDelegate extends Ui.BehaviorDelegate
{
	hidden var _view;

    function initialize( )
    {
        _view = null;
         startTimer();
    }
    
	function startTimer()
	{

        updateTimer.start( method(:updateCallback), 1000, true );
        
        timersRunning = true;

	}
    
    function updateCallback()
    {
   	
        count1 += 1;
                
        Ui.requestUpdate();
    }
	
	// Cycle through the pages after -1
    function onNextPage()
    {
		_view.nextPage();
		forceUpdate();
		
        return true;
    }

    function onPreviousPage() 
    {
		_view.previousPage();
		forceUpdate();   
		
        return true;
    }
    
    function onTap( evt )
    {
		var tap = evt.getCoordinates();
		
        if( tap[1] < 60 )
        {
			return onNextMode();   
        }    	
		else if( tap[1] >= 60 )
        {
			return onPreviousMode();   
        }    	
 		
 		return false;
    }

	function onNextMode()
	{
		if ( _view != null )
		{
			_view.increaseElements();
			forceUpdate();   
		}
        return true;		
	}
	

	function onPreviousMode()
	{
		if ( _view != null )
		{
			_view.decreaseElements();
			forceUpdate();   
		}
		
        return true;		
	}
	
    function onMenu()
    {
    	// if we have a top level view, push a second level view
		if ( _view == null )
		{
	    	_view = new RandomWidgetNumberView( false );
	    	WatchUi.pushView( _view, delegate, WatchUi.SLIDE_IMMEDIATE );
	    	
	    	forceUpdate();
    	}
    	
        return true;
    }
    
    function forceUpdate()
    {
		count1 = 5;
		Ui.requestUpdate();
    }
    
    function onBack()
    {   
     	
     	WatchUi.popView ( WatchUi.SLIDE_IMMEDIATE );
     	_view = null;
    		
    	return true;
    }
    
    function onKey( evt )
    {
		var key = evt.getKey();
		
        if( key == KEY_ENTER || key == KEY_START )
        {
    		Sys.println( "Start pushed" );
			_view.increaseElements();
			forceUpdate();   
    		
        }    	
 		
 		return true;
    }
	
}
