package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class Cursor extends Entity 
	{
		
		public var target:Spritemap = new Spritemap(Embed.TARGET, 9, 9);
		
		public function Cursor(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
		override public function added():void 
		{
			super.added();
			
			target.add("target", [0], 1, false);
			
			target.centerOrigin();
			
			graphic = target;
		}
		
		override public function update():void 
		{
			super.update();
			x = FP.world.mouseX;
			y = FP.world.mouseY;
		}
		
	}

}