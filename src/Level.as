package  
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author bsg
	 */
	public class Level extends World 
	{
		public var _level:Vector.<Room>;
		
		public var _generator:GenerateRoom;
		
		public var player:Player;
		
		public var target:Cursor;
		
		public static var ref:Level;
		
		public function Level() 
		{
			super();
			
			ref = this;
			
			_level = new Vector.<Room>();
			
			_generator = new GenerateRoom();
			
			_generator.createRooms(this);
			
			Generate();
		}
		
		override public function begin():void {
			super.begin();
			
			FP.console.enable();
			FP.console.visible = false;
			
			target = new Cursor();
			add(target);
			Mouse.hide();
			
			player = new Player(150, 150);
			add(player);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.SPACE))
			{
				FP.world = new Level;
			}
			
			if (Input.released(Key.C))
			{
				FP.console.visible = !FP.console.visible;
			}
			
			if (Input.released(Key.V))
			{
				Mouse.show();
			}
			else if (Input.released(Key.B))
			{
				Mouse.hide();
			}
			
		}
		
		public function Generate():void
		{
			//tableau des rooms temporaires
			var tab:Vector.<Room> = new Vector.<Room>();
			var index:int = 0;
			
			//vérification des portes dans les salles adjacentes
			var charactB:int;
			var charactR:int;
			
			//placement des salles
			var X:int = 0;
			var Y:int = 0;
			
			var randAlcolve:int;
			
			//********************ROOM 1 *********************
			
			//recherche des rooms N1 et ajout dans le tableau tab
			for (var i:int = 0; i < _generator._tabRoom.length; i++)
			{
				if (_generator._tabRoom[i]._id == 1)
				{
					tab.push( _generator._tabRoom[i]);
				}
			}
			
			//selecton entre les rooms 1
			var rand:int = Math.random() * tab.length;
			
			//ajout de la room 1 dans le tableau definitif
			tab[rand].printRoom();
			_level.push(tab[rand]);
			_level[index].placeRoom(X, Y);
			
			Y += 300;
			
			//trace du premier cube
			//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
			index ++;
			
			//********************ROOM 5 *********************
			
			for (var f:int = 0; f < 3; f++)
			{
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactB = _level[index - 1]._B;
				
				//recherche des rooms N5 et ajout dans le tableau tab
				for ( var a:int = 0; a < _generator._tabRoom.length; a++)
				{
					if (_generator._tabRoom[a]._id == 5)
					{
						if (_generator._tabRoom[a]._T == charactB)
						{
							tab.push( _generator._tabRoom[a]);
						}
					}
				}
			
				//selecton entre les rooms 5
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 5 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				Y += 300;
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index ++;
			}
			
			//********************ROOM 7 *********************
			
			//réinitialisation du tab
			tab = new Vector.<Room>();
			
			charactB = _level[index - 1]._B;
			
			//recherche des rooms N7 et ajout dans le tableau tab
			for ( var b:int= 0; b < _generator._tabRoom.length; b++)
			{
				if (_generator._tabRoom[b]._id == 7)
				{
					if(_generator._tabRoom[b]._T == charactB)
						tab.push( _generator._tabRoom[b]);
				}
			}
			
			//selecton entre les rooms 7
			rand = Math.random() * tab.length;
			
			randAlcolve = Math.random() * 6;
			
			//ajout de la room 7 dans le tableau definitif
			tab[rand].printRoom();
			tab[rand].addAlcolve(randAlcolve);
			_level.push(tab[rand]);
			_level[index].placeRoom(X, Y);
			
			//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
			index++;
			
			var j:int = 0;
			
			//colonnes du milieu
			
				Y = 0;
				X += 300;
				
				//********************ROOM 2 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				
				//recherche des rooms N2 et ajout dans le tableau tab
				for ( var c:int= 0; c < _generator._tabRoom.length; c++)
				{
					if (_generator._tabRoom[c]._id == 2)
					{
						if(_generator._tabRoom[c]._L == charactR)
							tab.push( _generator._tabRoom[c]);
					}
				}
				
				//selecton entre les rooms 2
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 2 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				Y += 300;
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				//********************ROOM 6 *********************
				
				for (var p:int = 0; p < 3; p++)
				{
					//réinitialisation du tab
					tab = new Vector.<Room>();
					
					charactR = _level[index - 5]._R;
					charactB = _level[index - 1]._B;
					
					//recherche des rooms N6 et ajout dans le tableau tab
					for (var t:int = 0; t < _generator._tabRoom.length; t++)
					{
						if (_generator._tabRoom[t]._id == 6)
						{
							if (_generator._tabRoom[t]._L == charactR && _generator._tabRoom[t]._T == charactB)
							{
								tab.push( _generator._tabRoom[t]);
							}
						}
					}
					
					//selecton entre les rooms 6
					rand = Math.random() * tab.length;
					
					randAlcolve = Math.random() * 6;
					
					//ajout de la room 6 dans le tableau definitif
					tab[rand].printRoom();
					tab[rand].addAlcolve(randAlcolve);
					_level.push(tab[rand]);
					_level[index].placeRoom(X, Y);
					
					Y += 300;
					
					//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
					index++;
					
				}
				
				//********************ROOM 9 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				charactB = _level[index - 1]._B;
				
				//recherche des rooms N9 et ajout dans le tableau tab
				for ( var d:int= 0; d < _generator._tabRoom.length; d++)
				{
					if (_generator._tabRoom[d]._id == 9)
					{
						if(_generator._tabRoom[d]._L == charactR && _generator._tabRoom[d]._T == charactB)
							tab.push( _generator._tabRoom[d]);
					}
				}
				
				//selecton entre les rooms 9
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 9 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				Y = 0;
				X += 300;
				
				//********************ROOM 2 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				
				//recherche des rooms N2 et ajout dans le tableau tab
				for ( var n:int= 0; n < _generator._tabRoom.length; n++)
				{
					if (_generator._tabRoom[n]._id == 2)
					{
						if(_generator._tabRoom[n]._L == charactR)
							tab.push( _generator._tabRoom[n]);
					}
				}
				
				//selecton entre les rooms 2
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 2 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				Y += 300;
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				//********************ROOM 6 *********************
				j = 0;
				for (j = 0; j < 3; j++)
				{
					//réinitialisation du tab
					tab = new Vector.<Room>();
					
					charactR = _level[index - 5]._R;
					charactB = _level[index - 1]._B;
					
					//recherche des rooms N6 et ajout dans le tableau tab
					for (var m:int = 0; m < _generator._tabRoom.length; m++)
					{
						if (_generator._tabRoom[m]._id == 6)
						{
							if(_generator._tabRoom[m]._L == charactR && _generator._tabRoom[m]._T == charactB)
								tab.push( _generator._tabRoom[m]);
						}
					}
					
					//selecton entre les rooms 6
					rand = Math.random() * tab.length;
						
					//ajout de la room 6 dans le tableau definitif
					tab[rand].printRoom();
					tab[rand].addAlcolve(randAlcolve);
					_level.push(tab[rand]);
					_level[index].placeRoom(X, Y);
					
					Y += 300;
					
					//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
					index++;
					
				}
				
				//********************ROOM 9 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				charactB = _level[index - 1]._B;
				
				//recherche des rooms N9 et ajout dans le tableau tab
				for ( var v:int= 0; v < _generator._tabRoom.length; v++)
				{
					if (_generator._tabRoom[v]._id == 9)
					{
						if(_generator._tabRoom[v]._L == charactR && _generator._tabRoom[v]._T == charactB)
							tab.push( _generator._tabRoom[v]);
					}
				}
				
				//selecton entre les rooms 9
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 9 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				Y = 0;
				X += 300;
				
				//********************ROOM 2 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				
				//recherche des rooms N2 et ajout dans le tableau tab
				for ( var w:int= 0; w < _generator._tabRoom.length; w++)
				{
					if (_generator._tabRoom[w]._id == 2)
					{
						if(_generator._tabRoom[w]._L == charactR)
							tab.push( _generator._tabRoom[w]);
					}
				}
				
				//selecton entre les rooms 2
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 2 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				Y += 300;
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				//********************ROOM 6 *********************
				j = 0;
				for (j = 0; j < 3; j++)
				{
					//réinitialisation du tab
					tab = new Vector.<Room>();
					
					charactR = _level[index - 5]._R;
					charactB = _level[index - 1]._B;
					
					//recherche des rooms N6 et ajout dans le tableau tab
					for (var z:int = 0; z < _generator._tabRoom.length; z++)
					{
						if (_generator._tabRoom[z]._id == 6)
						{
							if(_generator._tabRoom[z]._L == charactR && _generator._tabRoom[z]._T == charactB)
								tab.push( _generator._tabRoom[z]);
						}
					}
					
					//selecton entre les rooms 6
					rand = Math.random() * tab.length;
					
					randAlcolve = Math.random() * 6;
					
					//ajout de la room 6 dans le tableau definitif
					tab[rand].printRoom();
					tab[rand].addAlcolve(randAlcolve);
					_level.push(tab[rand]);
					_level[index].placeRoom(X, Y);
					
					Y += 300;
					
					//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
					index++;
					
				}
				
				//********************ROOM 9 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				charactB = _level[index - 1]._B;
				
				//recherche des rooms N9 et ajout dans le tableau tab
				for ( var q:int= 0; q < _generator._tabRoom.length; q++)
				{
					if (_generator._tabRoom[q]._id == 9)
					{
						if(_generator._tabRoom[q]._L == charactR && _generator._tabRoom[q]._T == charactB)
							tab.push( _generator._tabRoom[q]);
					}
				}
				
				//selecton entre les rooms 9
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 9 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
			
			//********************ROOM 3 *********************
			
				Y = 0;
				X += 300;	
			
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				
				//recherche des rooms N3 et ajout dans le tableau tab
				for ( var e:int= 0; e < _generator._tabRoom.length; e++)
				{
					if (_generator._tabRoom[e]._id == 3)
					{
						if(_generator._tabRoom[e]._L == charactR)
							tab.push( _generator._tabRoom[e]);
					}
				}
				
				//selecton entre les rooms 3
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 3 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				Y += 300;
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
				index++;
				
				//********************ROOM 4 *********************
				
				for (var s:int = 0; s < 3; s++)
				{
					//réinitialisation du tab
					tab = new Vector.<Room>();
					
					charactR = _level[index - 5]._R;
					charactB = _level[index - 1]._B;
					var prevR:int = Math.random() * 2;
					if (index == 23)
					{
						prevR = 1;
					}
					else if (charactR == 0 && charactB == 0)
					{
						prevR = 1;
					}
					
					//recherche des rooms N4 et ajout dans le tableau tab
					for ( var y:int= 0; y < _generator._tabRoom.length; y++)
					{
						if (_generator._tabRoom[y]._id == 4)
						{
							//trace("charactR:" + charactR + " charactB:" + charactB + " prevR:" + prevR);
							if(_generator._tabRoom[y]._L == charactR && _generator._tabRoom[y]._T == charactB && _generator._tabRoom[y]._B == prevR)
								tab.push( _generator._tabRoom[y]);
						}
					}
					
					//selecton entre les rooms 4
					rand = Math.random() * tab.length;
					
					randAlcolve = Math.random() * 6;
					
					//ajout de la room 4 dans le tableau definitif
					tab[rand].printRoom();
					tab[rand].addAlcolve(randAlcolve);
					_level.push(tab[rand]);
					_level[index].placeRoom(X, Y);
					
					Y += 300;
					
					//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
					index++;
					
				}
				
				//********************ROOM 8 *********************
				
				//réinitialisation du tab
				tab = new Vector.<Room>();
				
				charactR = _level[index - 5]._R;
				charactB = _level[index - 1]._B;
				
				//recherche des rooms N8 et ajout dans le tableau tab
				for ( var g:int = 0; g < _generator._tabRoom.length; g++)
				{
					if (_generator._tabRoom[g]._id == 8)
					{
						if(_generator._tabRoom[g]._L == charactR && _generator._tabRoom[g]._T == charactB)
							tab.push( _generator._tabRoom[g]);
					}
				}
				
				//selecton entre les rooms 8
				rand = Math.random() * tab.length;
				
				randAlcolve = Math.random() * 6;
				
				//ajout de la room 8 dans le tableau definitif
				tab[rand].printRoom();
				tab[rand].addAlcolve(randAlcolve);
				_level.push(tab[rand]);
				_level[index].placeRoom(X, Y);
				
				//trace(" id:" + _level[index]._id + " t:" + _level[index]._T + " r:" + _level[index]._R + " b:" + _level[index]._B + " l:" + _level[index]._L );
					
				index++;
			
				var room:Room ;
				var row:int = 0;
				var col:int = 0;
				var enemy:Enemy;
				var indexEnemy:int = 0;
				for (var h:int = 0; h < _level.length; h++)
				{
					room = _generator.RecreateRoom(_level[h]._id, _level[h]._T, _level[h]._R, _level[h]._B, _level[h]._L);
					room.addAlcolve(_level[h]._alcolve);
					add(room);
					room.placeRoom(col * 300, row * 300);
					row ++;
					if (row == 5)
					{
						col ++;
						row = 0;
					}
					
					if (h != 0)
					{	
						if (Math.random() * 3 < 2)
						{
							var pos:int = Math.random() * 4;
							enemy = new Enemy(index, room.spawns[pos].x, room.spawns[pos].y);
							indexEnemy++;
							add(enemy);
						}
					}
				}
		}
	}
}