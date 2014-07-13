package ;
import openfl.display.BitmapData;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author koras_dor
 */
class HitTester
{

	public function new() 
	{
		
	}
	
	public static function realHitTest(firstRect : Rectangle, firstBitmapData : BitmapData, secondRect : Rectangle, secondBitmapData : BitmapData) : Bool {
		var isCollide : Bool = false;
		
		var intersectRect : Rectangle = firstRect.intersection(secondRect);
		
		if (intersectRect.width > 0) {
			
			var secondOffsetX : Float = intersectRect.x - secondRect.x;
			var secondIntersectStartX : Int = Std.int(secondRect.width - (secondRect.width - secondOffsetX));
			var secondOffsetY : Float = intersectRect.y - secondRect.y;
			var secondIntersectStartY : Int = Std.int(secondRect.height - (secondRect.height - secondOffsetY));
			
			
			var firstOffsetX : Float = intersectRect.x - firstRect.x;
			var firstIntersectStartX : Int = Std.int(firstRect.width - (firstRect.width - firstOffsetX));
			var firstOffsetY : Float = intersectRect.y - firstRect.y;
			var firstIntersectStartY : Int = Std.int(firstRect.height - (firstRect.height - firstOffsetY));
			
			trace(firstBitmapData.getPixel32(0, 0));
			
			for (i in 0...Std.int(intersectRect.width)) 
			{
				for (j in 0...Std.int(intersectRect.height)) 
				{
					if ( firstBitmapData.getPixel32(firstIntersectStartX + i, firstIntersectStartY + j) != 0 && secondBitmapData.getPixel32(secondIntersectStartX + i, secondIntersectStartY + j) != 0) {
						isCollide = true;
					}
				}
			}
		} else {
			
			return isCollide;
		}
		
		if (isCollide == true) {
			trace("yes");
		}
		
		return isCollide;
	}
	
}