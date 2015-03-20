package  
{
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class Player extends Entity 
	{
		public var player:Spritemap = new Spritemap(Embed.PLAYER, 20, 20);
		
		public var speed:int;
		
		public var instantbullet:Bullet;
		
		public var canShoot:Boolean;
		public var time:int;
		public var cooldown:int;
		public var isReloading:Boolean;
		
		public var weapon:int; // 0=melee 1=range
		
		public var dead:Boolean;
		
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			speed = 5;
			canShoot = true;
			time = 0;
			cooldown = 10;
			isReloading = false;
			dead = false;
			weapon = 0;
		}
		
		override public function added():void 
		{
			super.added();
			
			player.add("idle", [0], 1, false);
			player.add("dead", [1], 1, false);
			
			player.centerOrigin();
			
			graphic = player;
			
			setHitbox(player.width, player.height);
			centerOrigin();
			
			type = "player";
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!dead)
			{
				
				if (collide("enemybullet", x, y) != null)
				{
					dead = true;
					player.play("dead");
					TweenMax.delayedCall(1, die);
				}
			
				if (!canShoot)
				{
					time ++;
					if (time == cooldown)
					{
						canShoot = true;
						isReloading = false;
						time = 0;
					}
				}
				
				if (Input.mouseDown && canShoot) 
				{
					if (weapon == 0)
					{
						var random:Number = Math.random() * 20;
						var radian:Number=(player.angle+80+random)*Math.PI/180;
						var dist:Number=30; 
						var distx:Number=dist*Math.cos(radian);
						var disty:Number=-1*dist*Math.sin(radian);

						var knife:MeleeWeapon = new MeleeWeapon(x, y);
						knife.destination = new Point(x + distx,y+disty);
						knife.ShootDuration = dist / knife.speed;
						Level.ref.add(knife);
						TweenMax.to(knife, dist / knife.speed, { x:x + distx , y:y + disty  } );
						canShoot = false;
						isReloading = true;
					}
					else if (weapon == 1)
					{
						var rando:Number = Math.random() * 20;
						var radians:Number=(player.angle+80+rando)*Math.PI/180;
						var distance:Number=150; 
						var dx:Number=distance*Math.cos(radians);
						var dy:Number=-1*distance*Math.sin(radians);

						var bullet:Bullet = new Bullet(x, y);
						bullet.destination = new Point(x + dx,y+dy);
						bullet.ShootDuration = distance / bullet.speed;
						Level.ref.add(bullet);
						TweenMax.to(bullet, distance / bullet.speed, { x:x + dx , y:y + dy  } );
						canShoot = false;
						isReloading = true;
					}
				}
				
				if (Input.check(Key.RIGHT)) 
				{
					if (collide("mur",x+speed,y)==null && collide("enemy",x+speed,y)==null) 
					{
						x += speed;
					}
				}
				else if (Input.check(Key.LEFT)) 
				{
					if (collide("mur",x-speed,y)==null && collide("enemy",x-speed,y)==null) 
					{
						x -= speed;
					}
				}
				
				if (Input.check(Key.UP)) 
				{
					if (collide("mur",x,y - speed)==null && collide("enemy",x,y - speed)==null) 
					{
						y -= speed;
					}
				}
				else if (Input.check(Key.DOWN)) 
				{
					if (collide("mur",x,y + speed)==null && collide("enemy",x,y + speed)==null) 
					{
						y += speed;
					}
				}
				FP.camera.x = (x - FP.halfWidth - (FP.halfWidth - FP.screen.mouseX)) + ((FP.screen.mouseX) / 50);
				FP.camera.y = (y - FP.halfHeight - (FP.halfHeight - FP.screen.mouseY)) + ((FP.screen.mouseY) / 50);
				
				player.angle = FP.angle(FP.halfWidth , FP.halfHeight, Input.mouseX, Input.mouseY) - 90;
			}
			
		}
		
		public function die():void
		{
			FP.world = new Level;
		}
		
	}

}