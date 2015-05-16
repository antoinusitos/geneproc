package  
{
	import com.greensock.TweenMax;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class blood extends Entity 
	{
	
		public var angle:Number;
		public var targetX:Number;
		public var targetY:Number;
		
		public var bloodsprite:Spritemap = new Spritemap(Embed.BLOOD, 20, 20);
		
		public function blood(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
		public function addDestination(theX:Number, theY:Number):void
		{
			targetX = theX;
			targetY = theY;
		}
		
		override public function added():void 
		{
			super.added();
			
			var radius:Number = Math.random() * 2 + 1;
			
			var img:Image = Image.createCircle(radius, 0xFF0000);
			img.centerOrigin();
			graphic = img;
			
			layer = 0
	
			//TweenMax.delayedCall(3, destroy);
		}
		
		public function destroy():void
		{
			Level.ref.remove(this);
		}
		
	}

}