package  
{
	import com.greensock.TweenMax;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class Weapon extends Entity 
	{
	
		public var weapon:Spritemap = new Spritemap(Embed.WEAPON, 10, 10);
		public var weapon_melee:Spritemap = new Spritemap(Embed.WEAPONMELEE, 10, 10);
		public var weaponType:Number
		
		public function Weapon(Type:Number, x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			
			weaponType = Type;
			
		}
		
		override public function added():void 
		{
			super.added();
			
			if(weaponType == 1)
				graphic = weapon;
			else
				graphic = weapon_melee;
			
			setHitbox(weapon.width*2, weapon.height*2);
			centerOrigin();
			
			type = "weapon";
			
			TweenMax.to(this, 0.3, { x : x + Math.floor(Math.random() * (20 - (-20) + 1)) -20, y: y + Math.floor(Math.random() * (20 - (-20) + 1)) -20 } );
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.CONTROL)) 
			{
				if (collide("player", x, y) != null)
				{
					Player(collide("player", x, y) ).weapon = weaponType;
					trace("attribute:" + weaponType);
					Player(collide("player", x, y) ).changeAnimationWeapon();
					Level.ref.remove(this);
				}
			}
		}
		
		
	}

}