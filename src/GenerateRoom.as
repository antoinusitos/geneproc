package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class GenerateRoom extends Entity 
	{
		
		public var _tabRoom:Vector.<Room>;
		
		public function GenerateRoom(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			_tabRoom = new Vector.<Room>();
		}
		
		public override function added():void 
		{
			super.added();
			
		}
		
		public function RecreateRoom(id:int, top:int, right:int, bot:int, left:int) :Room
		{
			return new Room(id, top, right, bot, left);
		}
		
		public function createRooms(ref:Level):void
		{
			
			//piece 1
			var temp:Room = new Room(1, 0, 1, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(1, 0, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(1, 0, 0, 1, 0);
			_tabRoom.push(temp);
			
			//piece 2
			temp = new Room(2, 0, 1, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(2, 0, 0, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(2, 0, 1, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(2, 0, 1, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(2, 0, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(2, 0, 0, 0, 1);
			_tabRoom.push(temp);
			
			//piece 3
			temp = new Room(3, 0, 0, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(3, 0, 0, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(3, 0, 0, 0, 1);
			_tabRoom.push(temp);
			
			//piece 4
			temp = new Room(4, 1, 0, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(4, 1, 0, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(4, 1, 0, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(4, 0, 0, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(4, 0, 0, 1, 0);
			_tabRoom.push(temp);
			
			//piece 5
			temp = new Room(5, 1, 1, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(5, 1, 0, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(5, 1, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(5, 0, 1, 1, 0);
			_tabRoom.push(temp);
			
			//piece 6
			temp = new Room(6, 1, 1, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 0, 1, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 0, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 0, 0, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 0, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(6, 0, 1, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(6, 0, 1, 1, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 1, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 1, 1, 0);
			_tabRoom.push(temp);
			temp = new Room(6, 1, 0, 1, 1);
			_tabRoom.push(temp);
			
			//piece 7
			temp = new Room(7, 1, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(7, 1, 0, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(7, 0, 1, 0, 0);
			_tabRoom.push(temp);
			
			//piece 8
			temp = new Room(8, 1, 0, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(8, 0, 0, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(8, 1, 0, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(8, 0, 0, 0, 0);
			_tabRoom.push(temp);
			
			//piece 9
			temp = new Room(9, 1, 1, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(9, 1, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(9, 1, 0, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(9, 0, 1, 0, 1);
			_tabRoom.push(temp);
			temp = new Room(9, 0, 1, 0, 0);
			_tabRoom.push(temp);
			temp = new Room(9, 0, 0, 0, 1);
			_tabRoom.push(temp);
			
		}
		
	}

}