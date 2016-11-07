using Toybox.ActivityMonitor;
using Toybox.Math as Math;
using Toybox.Time;

class UpdaterBase
{
	var _elementCount;

	function initialize( elementCount )
	{
		
		_elementCount = elementCount;
		Math.srand( ActivityMonitor.getInfo().moveBarLevel + ActivityMonitor.getInfo().steps + Time.now().value() );
	}

	function onUpdate ( )
	{
		return "";
	}
	
	
}

class NumericUpdater extends UpdaterBase
{
	function initialize( numberCount )
	{
		UpdaterBase.initialize ( numberCount );
	}
	
	function onUpdate ( )
	{
    
    	var randomNumber;
    	var formatString;
    	
    	randomNumber = Math.rand() % Math.pow(10, _elementCount).toNumber();
    	
    	System.println( randomNumber );
    	
    	formatString = format("%0$1$d",[ _elementCount ]);

		return randomNumber.format(formatString);
	}
}

class AlphaUpdater extends UpdaterBase
{
	function initialize( numberCount )
	{
		UpdaterBase.initialize ( numberCount );
	}
	
	function onUpdate ( )
	{
    
    	var randomNumber;
    	var randomChars = "";
    	
    	for ( var i = 0; i < _elementCount; i++ )
    	{
	    	randomNumber = Math.rand()%26 + 65;
	    	
	    	randomChars = randomChars + chr ( randomNumber );
    	}
    	
    	System.println( randomChars );
 
		return randomChars;
	}
	
 	function chr ( num ) 
 	{
        // Limitation: Need supported escape sequences for " and %
        var ASCII = " ! #$ &'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        var char = "";

        if(num >= 32 && num <= 126) {
            char = ASCII.substring(num - 32, num - 32 + 1);
        }

        return(char);
    }
	
}


class AlphaNumericUpdater extends UpdaterBase
{
	function initialize( numberCount )
	{
		UpdaterBase.initialize ( numberCount );
	}
	
	function onUpdate ( )
	{
    
    	var randomNumber;
    	var randomChars = "";
    	
    	for ( var i = 0; i < _elementCount; i++ )
    	{
    		// pick a number between 0 and 35
    		
	    	randomNumber = Math.rand() % 36;
	    	
	    	// if the number is 0 - 25 convert it to a letter
	    	if ( randomNumber < 26 )
	    	{
	    		randomChars = randomChars + chr ( randomNumber + 65 );
	    	}
	    	else // otherwise convert it to a number 
	    	{
	    		randomChars = randomChars + chr ( randomNumber + 22 );
	    	}
    	}
    	
    	System.println( randomChars );
 
		return randomChars;
	}
	
 	function chr ( num ) 
 	{
        // Limitation: Need supported escape sequences for " and %
        var ASCII = " ! #$ &'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        var char = "";

        if(num >= 32 && num <= 126) {
            char = ASCII.substring(num - 32, num - 32 + 1);
        }

        return(char);
    }
	
}