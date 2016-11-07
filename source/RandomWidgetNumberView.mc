using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor;
using Toybox.Math as Math;
using Toybox.Time;

class RandomWidgetNumberView extends Ui.View 
{

	var topLevelView;
	hidden var _updater;
	hidden var _page;
	hidden var _elementCount;
	
    function initialize( topLevel ) 
    {
    	if ( topLevel != null )
    	{
    		topLevelView = topLevel;
    	}
    	else
    	{
    		topLevelView = true;
    	}
    	
    	_page = 0;
    	_elementCount = 2;
		
		refreshUpdater();		
    }
	
	function refreshUpdater ()
	{
		if ( _page == 0 )
		{
			_updater = new NumericUpdater( _elementCount );
		}
		else if ( _page == 1 )
		{
			_updater = new AlphaUpdater( _elementCount );
		}
		else if ( _page == 2 )
		{
			_updater = new AlphaNumericUpdater( _elementCount );
		}
		else
		{
			_updater = new NumericUpdater( _elementCount );
		}
	}
	
	function nextPage()
	{
		// if we're at the last page then return to the first page
		if ( _page == 2 )
		{
			_page = 0;
		}
		else 	// otherwise increment to the next page
		{
			_page += 1;
		}
		
		refreshUpdater();
	}
	
	function previousPage()
	{
		// if we're at the first page then return to the last page
		if ( _page == 0 )
		{
			_page = 1;
		}
		else 	// otherwise decrement to the previous page
		{
			_page -= 1;
		}
		
		refreshUpdater();
	}
	
	function increaseElements()
	{
		// Only increment if we're below the maximum element count
		if ( _elementCount < 10 )
		{
			_elementCount += 1;
		}
		
		refreshUpdater();
	}
	
	function decreaseElements()
	{
		// Only decrement if we're above the minimum element count
		if ( _elementCount > 1 )
		{
			_elementCount -= 1;
		}
		
		refreshUpdater();
	}
	
	
    //! Load your resources here
    function onLayout(dc) 
    {
    	System.println("onLayout");
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() 
    {
    	System.println("onShow");
    }

    //! Update the view
    function onUpdate(dc) 
    {
    	var randomElement;
    	
    	if ( count1 == 1 )
    	{
    		setField ( dc, "Countdown", "...." );
    	}
    	else if ( count1 == 2 )
    	{
    		setField ( dc, "Countdown", "..." );
    	}
    	else if ( count1 == 3 )
    	{
    		setField ( dc, "Countdown", ".." );
    	}
    	else if ( count1 == 4 )
    	{
    		setField ( dc, "Countdown", "." );
    	}
    	else if ( count1 >= 5 )
    	{
    
			randomElement = _updater.onUpdate ( dc );
    	
	    	setField ( dc, "RandomNumber", randomElement );
	    	setField ( dc, "Countdown", "....." );
	    	
	    	count1 = 0;
		}
		    	
    	if ( !topLevelView )
    	{
    		setField ( dc, "Symbols", "...." );
    	}
    	
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() 
    {
    	System.println("onHide");
    
    }
    
	function setField ( dc, drawableId, text )
	{
        var drawable;
        
        //set the interval name
        drawable = View.findDrawableById( drawableId );
        drawable.setText( text );
        drawable.draw(dc);
	}

}
