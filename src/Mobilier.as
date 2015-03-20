package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class Mobilier extends Entity 
	{
		
		public var table:Spritemap = new Spritemap(Embed.LIT, 60, 30);
		
		public function Mobilier(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
		override public function added():void 
		{
			super.added();
			
			table.add("idle", [0], 1, false);
			
			table.centerOrigin();
			
			graphic = table;
			
			setHitbox(table.width + 4, table.height + 4);
			centerOrigin();
			
			//table.angle = Math.random() * 360;
			
			type = "table";
		}
		
	}

}