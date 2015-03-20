package  
{
	import com.greensock.TweenMax;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author bsg
	 */
	public class Enemy extends Entity 
	{
		public var enemy:Spritemap = new Spritemap(Embed.PLAYER, 20, 20);
		public var img:Image;
		public var shooting:Boolean;
		public var detected:Boolean;
		public var dead:Boolean;
		public var id:int;
		
		public var canShoot:Boolean;
		public var time:int;
		public var cooldown:int;
		
		public function Enemy(Id:int,  x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			shooting = false;
			dead = false;
			id = Id;
			canShoot = true;
			time = 0;
			cooldown = 10;
		}
		
		override public function added():void 
		{
			super.added();

			enemy.add("idle", [0], 1, false);
			enemy.add("dead", [1], 1, false);
			
			enemy.centerOrigin();
			
			graphic = enemy;
			
			setHitbox(enemy.width + 4, enemy.height + 4);
			centerOrigin();
			
			enemy.angle = Math.random() * 360;
			
			type = "enemy";
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!dead)
			{
			
				if (!canShoot)
				{
					time ++;
					if (time == cooldown)
					{
						canShoot = true;
						time = 0;
					}
				}
				
				
				if (collide("bullet", x, y) != null)
				{
					dead = true;
					enemy.play("dead");
				}
				else if (collide("melee", x, y) != null)
				{
					dead = true;
					enemy.play("dead");
				}
			
				var player:Player = Level.ref.player;
				
				if (player == null || player.dead == true)
					return;
				
				if (distanceFrom(player) < 350 && player.isReloading && player.weapon == 1)
				{
					if (!detected)
					{
						TweenMax.delayedCall(0.1, detectPlayer);
						detected = true;
					}
				}
				if (distanceFrom(player) < 150)
				{
					if (!detected)
					{
						var anglePE:Number = FP.angle(x, y, player.x, player.y) - 90;
						if (enemy.angle + 50 > anglePE && enemy.angle - 50 < anglePE)
						{
							detected = true;
						}
					}
					else if (canShoot)
					{
						TweenMax.killTweensOf(this);
						
						enemy.angle = FP.angle(x, y, player.x, player.y) - 90;
						
						shoot();
					}
				}
				else
				{
					detected = false;
				}
			}
		}
		
		public function detectPlayer():void
		{
			detected = true;
		}
		
		public function die():void
		{
			if (!dead)
			{
				dead = true;
				setHitbox(0, 0);
			}
		}
		
		public function shoot():void
		{
			var rando:Number = Math.random() * 20;
			var radians:Number=(enemy.angle+80+rando)*Math.PI/180;
			var distance:Number=150; 
			var dx:Number=distance*Math.cos(radians);
			var dy:Number=-1*distance*Math.sin(radians);

			var bullet:EnemyBullet = new EnemyBullet(id, x, y);
			bullet.destination = new Point(x + dx,y+dy);
			bullet.ShootDuration = distance / bullet.speed;
			Level.ref.add(bullet);
			TweenMax.to(bullet, distance / bullet.speed, { x:x + dx , y:y + dy  } );
			
			canShoot = false;
		}
		
	}

}