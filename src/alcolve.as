package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class alcolve extends Entity 
	{
		
		public var _id:int;
		
		public var X:int = 0;
		public var Y:int = 0;
		
		public function alcolve(ID:int, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
			_id = ID;
			
		}
		
		public function placeAlcolve(x:int, y:int):void
		{
			X = x;
			Y = y;
			//trace("place X:" + X + " Y:" + Y);
		}
		
		override public function added():void 
		{
			super.added();
			
			draw();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function draw():void
		{
			var tilesWall = new Vector.<Tile>();
			var TileTemp:Tile;
			
			var col:int = 0;
			var row:int = 0;
			
			if(_id != 0 && _id != 5)
				placeWall();
			else if (_id == 5)
			{
				putWall();
			}
			else
			{
				return;
			}
			
			for (var kk:int = 0; kk < tilesWall.length; kk++)
			{
				//trace("tile:" + tiles[k].id);
				Level.ref.add(tilesWall[kk]);
			}
		}
		
		public function placeWall():void
		{
			var TileTemp:Tile;
			//gauche
			for (var j:int = 0; j < 4; j++)
			{
				if (_id == 4 && (j==0 || j==1))
				{
					
				}
				else if (_id == 3 && (j==2 || j==3))
				{
					
				}
				else
				{
					TileTemp = new Tile(7, X +  0 * 30, Y + j * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			
			//haut
			for (var k:int = 0; k < 3; k++)
			{
				if (_id == 1 && (k == 1 || k == 2))
				{
					
				}
				else if (_id == 2 && (k == 1 || k == 0))
				{
					
				}
				else
				{
					TileTemp = new Tile(5, X +  k * 30, Y + 0 * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			
			//bas
			for (var n:int = 0; n < 3; n++)
			{
				TileTemp = new Tile(4, X +  n * 30, Y + 9 * 30);
				TileTemp.type = "mur";
				tilesWall.push(TileTemp);
			}
			
			//droite
			for (var l:int = 0; l < 4; l++)
			{
				TileTemp = new Tile(6, X +  9 * 30, Y + l * 30);
				TileTemp.type = "mur";
				tilesWall.push(TileTemp);
			}
		}
		
		public function putWall():void
		{
			//gauche
			for (var j:int = 0; j < 4; j++)
			{
				TileTemp = new Tile(7, X +  0 * 30, Y + j * 30);
				TileTemp.type = "mur";
				tilesWall.push(TileTemp);
			}
			
			//haut
			for (var k:int = 0; k < 4; k++)
			{
				if (k == 1 || k == 2)
				{
					
				}
				else
				{
					TileTemp = new Tile(5, X +  k * 30, Y + 0 * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			
			//bas
			for (var n:int = 0; n < 4; n++)
			{
				TileTemp = new Tile(4, X +  n * 30, Y + 9 * 30);
				TileTemp.type = "mur";
				tilesWall.push(TileTemp);
			}
			
			//droite
			for (var l:int = 0; l < 4; l++)
			{
				TileTemp = new Tile(6, X +  9 * 30, Y + l * 30);
				TileTemp.type = "mur";
				tilesWall.push(TileTemp);
			}
		}
	}

}