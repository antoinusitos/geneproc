package  
{
	/**
	 * ...
	 * @author bsg
	 */
	public class Embed 
	{
		
		//[Embed(source = '../assets/map.png')] static public const MAP:Class;
		[Embed(source = '../assets/tilemap.png')] static public const MAP:Class;
		[Embed(source = '../assets/player_walk.png')] static public const PLAYER:Class;
		[Embed(source = '../assets/dead.png')] static public const DEAD:Class;
		[Embed(source = '../assets/target.png')] static public const TARGET:Class;
		
		[Embed(source = '../assets/table.png')] static public const TABLE:Class;
		[Embed(source = '../assets/lit.png')] static public const LIT:Class;
		
		[Embed(source = '../assets/shoot.mp3')] static public const SHOOT:Class;
		[Embed(source = '../assets/sword2.mp3')] static public const MELEE:Class;
	}

}