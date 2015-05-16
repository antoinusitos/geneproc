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
		public var enemy:Spritemap = new Spritemap(Embed.ENEMY, 20, 20);
		public var spr_dead:Spritemap = new Spritemap(Embed.ENEMYDEAD, 20, 40);
		public var img:Image;
		public var shooting:Boolean;
		public var detected:Boolean;
		public var dead:Boolean;
		public var id:int;
		
		public var canShoot:Boolean;
		public var canMove:Boolean;
		public var time:int;
		public var move:int;
		public var cooldown:int;
		public var isSeeing:seenPlayer;
		
		public var weapon:int;
		
		public function Enemy(Id:int, theWeapon:int, x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			shooting = false;
			dead = false;
			id = Id;
			canShoot = true;
			canMove = true;
			time = 0;
			move = 0;
			cooldown = 10;
			weapon = theWeapon;
		}
		
		override public function added():void 
		{
			super.added();
			
			enemy.add("idle", [0], 1, false);
			enemy.add("pistol", [4], 1, true);
			
			spr_dead.add("idle", [1], 1, false);
			
			enemy.centerOrigin();
			
			spr_dead.centerOrigin();
			
			graphic = enemy;
			
			setHitbox(enemy.width + 4, enemy.height + 4);
			centerOrigin();
			
			enemy.angle = Math.random() * 360;
			
			type = "enemy";
			
			layer = 1
			
			if (weapon == 0)
			{
				enemy.play("idle");
			}
			else if (weapon == 1)
			{
				enemy.play("pistol");
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!dead)
			{
				if (weapon == 0)
				{
					enemy.play("idle");
				}
				else if (weapon == 1)
				{
					enemy.play("pistol");
				}
				if (!canMove)
				{
					move ++;
					if (move >= 100 )
					{
						canMove = true;
						move = 0;
					}
				}
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
					die();
					graphic = spr_dead;
					setHitbox();
					spr_dead.angle =  FP.angle(x , y, Level.ref.player.x, Level.ref.player.y) - 90;
				}
				else if (collide("melee", x, y) != null)
				{
					dead = true;
					die();
					graphic = spr_dead;
					setHitbox();
					spr_dead.angle =  FP.angle(x , y, Level.ref.player.x, Level.ref.player.y) - 90;
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
							if (canShoot)
							{
								if (isSeeing == null)
								{
									isSeeing = new seenPlayer(x, y);
									Level.ref.add(isSeeing);
								}
								else
								{
									if (isSeeing.see == true)
									{
										detected = true;
									}
									else
									{
										canShoot = false;
									}
								}
							}
						}
						else
						{
							anglePE = FP.angle(x, y, player.x, player.y) - 90;
							if (enemy.angle + 50 > anglePE && enemy.angle - 50 < anglePE)
							{
								Level.ref.remove(isSeeing);
								isSeeing = new seenPlayer(x, y);
									Level.ref.add(isSeeing);
							}
						}
					}
					else if (canShoot && detected && isSeeing)
					{
						if ((distanceFrom(player) < 150 && weapon == 1) || (distanceFrom(player) < 75 && weapon == 0))
						{
							TweenMax.killTweensOf(this);
							
							enemy.angle = FP.angle(x, y, player.x, player.y) - 90;
							
							shoot();
						}
					}
				}
				else
				{
					detected = false;
					if (detected)
						Level.ref.remove(isSeeing);
				}
				
				if (!detected && canMove)
				{
					var toX:Number = x + Math.floor(Math.random() * (50 - ( -50) + 1)) - 50;
					var toY:Number = y + Math.floor(Math.random() * (50 - ( -50) + 1)) - 50;
					
					if (collide("mur", toX, toY) == null)
					{
						enemy.angle = FP.angle(x, y, toX, toY) - 90;
						TweenMax.to(this, 0.5, { x : toX , y: toY , onUpdate: detectWall } );
						canMove = false;
					}
					
				}
			}
		}
		
		public function detectWall():void
		{
			if (collide("mur", x, y) != null)
			{
				TweenMax.killTweensOf(this);
			}	
		}
		
		public function detectPlayer():void
		{
			detected = true;
		}
		
		public function die():void
		{
			if (isSeeing != null)
			{
				Level.ref.remove(isSeeing);
			}
			
			var blood0:blood = new blood(x, y);
			var blood1:blood = new blood(x, y);
			var blood2:blood = new blood(x, y);
			var blood3:blood = new blood(x, y);
			var blood4:blood = new blood(x, y);
			var blood5:blood = new blood(x, y);
			var blood6:blood = new blood(x, y);
			var blood7:blood = new blood(x, y);
			var blood8:blood = new blood(x, y);
			var blood9:blood = new blood(x, y);
			var dest0:Point = FindDestionationPointde();
			var dest1:Point = FindDestionationPointde();
			var dest2:Point = FindDestionationPointde();
			var dest3:Point = FindDestionationPointde();
			var dest4:Point = FindDestionationPointde();
			var dest5:Point = FindDestionationPointde();
			var dest6:Point = FindDestionationPointde();
			var dest7:Point = FindDestionationPointde();
			var dest8:Point = FindDestionationPointde();
			var dest9:Point = FindDestionationPointde();
			Level.ref.add(blood0);
			Level.ref.add(blood1);
			Level.ref.add(blood2);
			Level.ref.add(blood3);
			Level.ref.add(blood4);
			Level.ref.add(blood5);
			Level.ref.add(blood6);
			Level.ref.add(blood7);
			Level.ref.add(blood8);
			Level.ref.add(blood9);
			var vitesse:Number = 0.2;
			TweenMax.to(blood0, vitesse, { x:dest0.x , y:dest0.y  } );
			TweenMax.to(blood1, vitesse, { x:dest1.x , y:dest1.y  } );
			TweenMax.to(blood2, vitesse, { x:dest2.x , y:dest2.y  } );
			TweenMax.to(blood3, vitesse, { x:dest3.x , y:dest3.y  } );
			TweenMax.to(blood4, vitesse, { x:dest4.x , y:dest4.y  } );
			TweenMax.to(blood5, vitesse, { x:dest5.x , y:dest5.y  } );
			TweenMax.to(blood6, vitesse, { x:dest6.x , y:dest6.y  } );
			TweenMax.to(blood7, vitesse, { x:dest7.x , y:dest7.y  } );
			TweenMax.to(blood8, vitesse, { x:dest8.x , y:dest8.y  } );
			TweenMax.to(blood9, vitesse, { x:dest9.x , y:dest9.y  } );
			var weap:Weapon = new Weapon(weapon, x, y);
			Level.ref.add(weap);
			dead = true;
			setHitbox(0, 0);
		}
		
		public function FindDestionationPointde():Point
		{
			var retour:Point = new Point();
			retour.x = x + x - Level.ref.player.x + Math.random() * 30 - 30
			retour.y = y + y - Level.ref.player.y + Math.random() * 30 - 30
			return retour;
		}
		
		public function shoot():void
		{
			if (weapon == 0)
			{
				var random:Number = Math.random() * 20;
				var radian:Number=(enemy.angle+80+random)*Math.PI/180;
				var dist:Number=30; 
				var distx:Number=dist*Math.cos(radian);
				var disty:Number=-1*dist*Math.sin(radian);

				var knife:EnemyMelee = new EnemyMelee(id, x, y);
				knife.originBulletX = x;
				knife.originBulletY = y;
				knife.destination = new Point(x + distx,y+disty);
				knife.ShootDuration = dist / knife.speed;
				Level.ref.add(knife);
				TweenMax.to(knife, dist / knife.speed, { x:x + distx , y:y + disty  } );
			}
			else
			{
				var rando:Number = Math.random() * 20;
				var radians:Number=(enemy.angle+80+rando)*Math.PI/180;
				var distance:Number=150; 
				var dx:Number=distance*Math.cos(radians);
				var dy:Number=-1*distance*Math.sin(radians);

				var bullet:EnemyBullet = new EnemyBullet(id, x, y);
				bullet.originBulletX = x;
				bullet.originBulletY = y;
				bullet.destination = new Point(x + dx,y+dy);
				bullet.ShootDuration = distance / bullet.speed;
				Level.ref.add(bullet);
				TweenMax.to(bullet, distance / bullet.speed, { x:x + dx , y:y + dy  } );
			}
				
			canShoot = false;
		}
		
	}

}