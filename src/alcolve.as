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
		public var _orientation:int;
		public var _type:int;
		
		public var X:int = 0;
		public var Y:int = 0;
		
		public var tilesWall:Vector.<Tile> = new Vector.<Tile>();
		public var TileTemp:Tile;
		
		public function alcolve(ID:int, orientation:int, type:int, x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
			_id = ID;
			_orientation = orientation;
			_type = type;
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
			
			var col:int = 0;
			var row:int = 0;
			
			if (_id != 0 && _id != 5)
			{
				placeWall();
				trace("place wall");
			}
			else if (_id == 5)
			{
				putWall();
			}
			
			for (var z:int = 0; z < tilesWall.length; z++)
			{
				Level.ref.add(tilesWall[z]);
			}
			
		}
		
		public function placeWall():void
		{
			var sortie:int = Math.random() * 2 +1;
			trace("sortie"+sortie);
			if (_orientation == 1)
			{
				//gauche
				for (var j:int = 0; j < 4; j++)
				{
					TileTemp = new Tile(7, X +  0 * 30, Y + j * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
				
				//haut
				if (_type == 2)
				{
					for (var k:int = 0; k < 3; k++)
					{
						
						TileTemp = new Tile(5, X +  k * 30, Y + 0 * 30);
						TileTemp.type = "mur";
						tilesWall.push(TileTemp);
					}
				}
				else if (_type == 1)
				{
					for (var kk:int = 0; kk < 3; kk++)
					{
						if (sortie == 1 && (kk == 1 || kk == 2))
						{
						}
						else if (sortie == 2 && (kk == 1 || kk == 0))
						{
						}
						else
						{
							TileTemp = new Tile(5, X +  kk * 30, Y + 0 * 30);
							TileTemp.type = "mur";
							tilesWall.push(TileTemp);
						}
					}
				}
				
				//bas
				if (_type == 1)
				{
					for (var n:int = 0; n < 3; n++)
					{
						TileTemp = new Tile(4, X +  n * 30, Y + 3 * 30);
						TileTemp.type = "mur";
						tilesWall.push(TileTemp);
					}
				}
				else if (_type == 2)
				{
					for (var nn:int = 0; nn < 3; nn++)
					{
						if (sortie == 1 && (nn == 1 || nn == 0))
						{
						}
						else if (sortie == 2 && (nn == 1 || nn == 2))
						{
						}
						else
						{
							TileTemp = new Tile(4, X +  nn * 30, Y + 3 * 30);
							TileTemp.type = "mur";
							tilesWall.push(TileTemp);
						}
					}
				}
				
				//droite
				for (var l:int = 0; l < 4; l++)
				{
					TileTemp = new Tile(6, X +  2 * 30, Y + l * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			else if (_orientation == 2)
			{
				//gauche
				if (_type == 1)
				{
					for (var jj:int = 0; jj < 3; jj++)
					{
						if (sortie == 1 && (jj == 0 || jj == 1)) { }
						else if (sortie == 2 && (jj == 2 || jj == 1)) { }
						else
						{
							TileTemp = new Tile(7, X +  0 * 30, Y + jj * 30);
							TileTemp.type = "mur";
							tilesWall.push(TileTemp);
						}
					}
				}
				else if (_type == 2)
				{
					for (var jjj:int = 0; jjj < 3; jjj++)
					{
						TileTemp = new Tile(7, X +  0 * 30, Y + jjj * 30);
						TileTemp.type = "mur";
						tilesWall.push(TileTemp);
					}
				}
				
				//haut
				for (var kkk:int = 0; kkk < 4; kkk++)
				{
					
					TileTemp = new Tile(5, X +  kkk * 30, Y + 0 * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
				
				//bas
				for (var nnn:int = 0; nnn < 4; nnn++)
				{
					TileTemp = new Tile(4, X +  nnn * 30, Y + 2 * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
				
				//droite
				if (_type == 1)
				{
					for (var lll:int = 0; lll < 3; lll++)
					{
						TileTemp = new Tile(6, X +  3 * 30, Y + lll * 30);
						TileTemp.type = "mur";
						tilesWall.push(TileTemp);
					}
				}
				else if (_type == 2)
				{
					for (var ll:int = 0; ll < 3; ll++)
					{
						if (sortie == 1 && (ll == 0 || ll == 1)) { }
						else if (sortie == 2 && (ll == 2 || ll == 1)) { }
						else
						{
							TileTemp = new Tile(6, X +  3 * 30, Y + ll * 30);
							TileTemp.type = "mur";
							tilesWall.push(TileTemp);
						}
					}
				}
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