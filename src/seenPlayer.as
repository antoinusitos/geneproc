package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class seenPlayer extends Entity 
	{
		
		public var target:Point;
		public var see:Boolean;
		
		public function seenPlayer(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			see = false;			
		}
		
		override public function added():void 
		{
			super.added();
			
			var img:Image = Image.createRect(5, 5, 0x0000FF);
			img.centerOrigin();
			
			//graphic = img;

		}
		
		override public function update():void 
		{
			super.update();
			
			
			moveTo(Level.ref.player.x, Level.ref.player.y, "mur", true);
			
			if (collide("mur", x, y))
			{
				Level.ref.remove(this);
			}
			else if (collide("mur", x+1, y))
			{
				Level.ref.remove(this);
			}
			else if (collide("mur", x-1, y))
			{
				Level.ref.remove(this);
			}
			else if (collide("mur", x, y+1))
			{
				Level.ref.remove(this);
			}
			else if (collide("mur", x, y-1))
			{
				Level.ref.remove(this);
			}
			else if (collide("player", x, y))
			{
				see = true;
				//trace("0");
				//Level.ref.remove(this);
			}
			else if (collide("player", x+1, y))
			{
				see = true;
				//trace("x+1");
				//Level.ref.remove(this);
			}
			else if (collide("player", x-1, y))
			{
				see = true;
				//trace("x-1");
				//Level.ref.remove(this);
			}
			else if (collide("player", x, y+1))
			{
				see = true;
				//trace("y+1");
				//Level.ref.remove(this);
			}
			else if (collide("player", x, y-1))
			{
				see = true;
				//trace("y-1");
				//Level.ref.remove(this);
			}
			
		}
		
	}

}