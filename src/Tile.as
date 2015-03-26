package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class Tile extends Entity 
	{
		
		public var map:Spritemap = new Spritemap(Embed.MAP, 30, 30);
		public var img:Image;
		public var id:int; 
		
		public function Tile(ID:int, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			id = ID;
		}
		
		override public function added():void 
		{
			super.added();
			
			map.add("sol0", [0], 1, false);
			map.add("sol1", [1], 1, false);
			map.add("sol2", [2], 1, false);
			map.add("sol3", [3], 1, false);
			map.add("sol4", [4], 1, false); //mur bas
			map.add("sol5", [5], 1, false); //mur haut
			map.add("sol6", [6], 1, false); //mur droite
			map.add("sol7", [7], 1, false); //mur gauche
			map.add("sol8", [8], 1, false); //coin gauche haut
			map.add("sol9", [9], 1, false); //coin droite haut
			map.add("sol10", [10], 1, false); //coin gauche bas
			map.add("sol11", [11], 1, false); //coin droite bas
			
			map.centerOrigin();

			graphic = map;
			
			if (id == 4)
			{
				setHitbox(30, 6, 15, -9);
			}
			else if (id == 5)
			{
				setHitbox(30, 6, 15, 15);
			}
			else if (id == 6)
			{
				setHitbox(6, 30, -9, 15);
			}
			else if (id == 7)
			{
				setHitbox(6, 30, 15, 15);
			}
			
			layer = 2;
			
			map.play("sol" + id);

		}
		
	}

}