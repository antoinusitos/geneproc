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
		[Embed(source = '../assets/enemy_walk.png')] static public const ENEMY:Class;
		[Embed(source = '../assets/dead.png')] static public const DEAD:Class;
		[Embed(source = '../assets/enemydead.png')] static public const ENEMYDEAD:Class;
		[Embed(source = '../assets/target.png')] static public const TARGET:Class;
		[Embed(source = '../assets/weapon.png')] static public const WEAPON:Class;
		[Embed(source = '../assets/weapon_melee.png')] static public const WEAPONMELEE:Class;
		[Embed(source = '../assets/blood.png')] static public const BLOOD:Class;
		[Embed(source = '../assets/logo_miami.png')] static public const MENU:Class;
		
		[Embed(source = '../assets/table.png')] static public const TABLE:Class;
		[Embed(source = '../assets/lit.png')] static public const LIT:Class;
		
		[Embed(source = '../assets/shoot.mp3')] static public const SHOOT:Class;
		[Embed(source = '../assets/sword2.mp3')] static public const MELEE:Class;
		[Embed(source = '../assets/menu.mp3')] static public const MENUSOUND:Class;
		[Embed(source = '../assets/level1.mp3')] static public const LEVEL1:Class;
		[Embed(source = '../assets/level2.mp3')] static public const LEVEL2:Class;
		
		static public function getAngle (x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			var dx:Number = x2 - x1;
			var dy:Number = y2 - y1;
			return Math.atan2(dy,dx);
		}
	}

}