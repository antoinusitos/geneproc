package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Mask;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class Room extends Entity 
	{
		
		public var tiles:Vector.<Tile>;
		public var tilesWall:Vector.<Tile>;
		
		public var _id:int;
		public var _T:int;
		public var _R:int;
		public var _B:int;
		public var _L:int;
		
		public var _alcolve:int;
		
		public var X:int = 0;
		public var Y:int = 0;
		
		public function Room(ID:int,  t:int, r:int, b:int, l:int, x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			
			_id = ID;
			_T = t;
			_R = r;
			_B = b;
			_L = l;
		}
		
		public function addAlcolve(alc:int):void
		{
			_alcolve = alc;
			
		}
		
		public function printRoom():void
		{
			//trace("room:"+_id+",T:"+_T+",R:"+_R+",B:"+_B+",L:"+_L);
		}
		
		public function placeRoom(x:int, y:int):void
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
			tiles = new Vector.<Tile>();
			tilesWall = new Vector.<Tile>();
			
			//choix parmis les tiles de sol
			var temp:int = Math.random() * 4;
			var TileTemp:Tile;
			
			//trace("id:" + _id + " tile:" + temp);
			
			var col:int = 0;
			var row:int = 0;
			
			//ajout du sol
			for (var i:int = 0; i < 100; i++)
			{
				//trace("row:" + Y+ row*30 + " col" + X+  col*30);
				TileTemp = new Tile(temp, X+  col*30,Y+ row*30);
				tiles.push(TileTemp);
				row++;
				if (row > 9)
				{
					col++;
					row = 0;
				}
			}
			
			placeWall();
			
			for (var k:int = 0; k < 100; k++)
			{
				//trace("tile:" + tiles[k].id);
				Level.ref.add(tiles[k]);
			}
			for (var kk:int = 0; kk < tilesWall.length; kk++)
			{
				//trace("tile:" + tiles[k].id);
				Level.ref.add(tilesWall[kk]);
			}
			
			//for (var kkk:int = 11; kkk < 12; kk++)
			//{
				var mobi:Mobilier = new Mobilier(X+30, Y +30);
				Level.ref.add(mobi);
			//}
			
			var coin:int = Math.random() * 4;
			
			var alco:alcolve;
			trace("id" + _id);
			trace("coin" + coin);
			
			if (coin == 0)
			{
				var r:int = Math.random() * 2;
				if (r == 0)
				{
					trace(r);
					alco = new alcolve(2, 1, 2);
				}
				else if (r == 1)
				{
					trace(r);
					alco = new alcolve(2, 2, 2);
				}
				
				alco.placeAlcolve(X, Y);
			}
			else if (coin == 1)
			{
				r = Math.random() * 2;
				if (r == 0)
				{
					trace(r);
					alco = new alcolve(2, 1, 2);
					alco.placeAlcolve(X+(7*30), Y);
				}
				else if (r == 1)
				{
					trace(r);
					alco = new alcolve(2, 2, 1);
					alco.placeAlcolve(X + (7 * 30), Y);
				}
			}
			else if (coin == 2)
			{
				r = Math.random() * 2;
				if (r == 0)
				{
					trace(r);
					alco = new alcolve(2, 1, 1);
					alco.placeAlcolve(X, Y+(6*30));
				}
				else if (r == 1)
				{
					trace(r);
					alco = new alcolve(2, 2, 2);
					alco.placeAlcolve(X, Y + (7 * 30));
				}
			}
			else if (coin == 3)
			{
				r = Math.random() * 2;
				if (r == 0)
				{
					trace(r);
					alco = new alcolve(2, 1, 1);
					alco.placeAlcolve(X+(7*30), Y+(6*30));
				}
				else if (r == 1)
				{
					trace(r);
					alco = new alcolve(2, 2, 1);
					alco.placeAlcolve(X + (7 * 30), Y + (7 * 30));
				}
			}
			
			alco.draw();
		}
		
		public function placeWall():void
		{
			var TileTemp:Tile;
			//gauche
			for (var j:int = 0; j < 10; j++)
			{
				if (_L == 1 && (j == 4 || j == 5))
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
			for (var k:int = 0; k < 10; k++)
			{
				if (_T == 1 && (k == 4 || k == 5))
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
			for (var n:int = 0; n < 10; n++)
			{
				if (_B == 1 && (n == 4 || n == 5))
				{
					
				}
				else
				{
					TileTemp = new Tile(4, X +  n * 30, Y + 9 * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			
			//droite
			for (var l:int = 0; l < 10; l++)
			{
				if (_R == 1 && (l == 4 || l == 5))
				{
					
				}
				else
				{
					TileTemp = new Tile(6, X +  9 * 30, Y + l * 30);
					TileTemp.type = "mur";
					tilesWall.push(TileTemp);
				}
			}
			
			
		}
		
	}

}