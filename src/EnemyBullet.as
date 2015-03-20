package  
{
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author bsg
	 */
	public class EnemyBullet extends Entity 
	{
	
		public var ShootDuration:Number;
		public var destination:Point;
		public var speed:Number;
		public var id:int;
		
		public var shoot:Sfx  = new Sfx (Embed.SHOOT);
		
		public function EnemyBullet(Id:int,x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			speed = 500;
			id = Id;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (collide("mur",x,y)!=null) 
			{
				die();
			}
			else if (collide("player", x, y) != null)
			{
				//FP.world = new Level;
			}
		}
		
		override public function added():void 
		{
			super.added();
			
			var img:Image = Image.createRect(5, 5, 0x00FF00);
			img.centerOrigin();
			
			graphic = img;
			
			type = "enemybullet";
			
			shoot.play();
			
			TweenMax.delayedCall(1, die);
		}
		
		private function die():void
		{
			Level.ref.remove(this);
		}
		
	}

}