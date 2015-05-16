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
		public var spr_dead:Spritemap = new Spritemap(Embed.DEAD, 20, 40);
		
		public var speed:int;
		
		public var instantbullet:Bullet;
		
		public var canShoot:Boolean;
		public var time:int;
		public var cooldown:int;
		public var isReloading:Boolean;
		
		public var weapon:int; // 0=melee 1=range
		
		public var dead:Boolean;
		public var move:Boolean;
		
		public var shake: Number;
		public var shakeAmount : Number;
		public var decreaseFactor : Number;
		
		public function Player(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			speed = 5;
			canShoot = true;
			time = 0;
			cooldown = 10;
			isReloading = false;
			dead = false;
			move = false;
			weapon = 0;
			shake = 0;
			shakeAmount = 0.7;
			decreaseFactor = 3;
		}
		
		override public function added():void 
		{
			super.added();
			
			player.add("idle", [0], 1, false);
			player.add("hit", [5, 0], 5, true);
			player.add("walk", [1, 0, 2, 0], 10, true);
			player.add("dead", [3], 1, false);
			player.add("pistol", [4], 1, true);
			
			spr_dead.add("idle", [0], 1, false);
			
			player.centerOrigin();
			
			graphic = player;
			
			setHitbox(player.width / 2, player.height / 2);
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
					graphic = spr_dead;
					var Thebullet:EnemyBullet = EnemyBullet(collide("enemybullet", x, y));
					spr_dead.angle = FP.angle(FP.halfWidth , FP.halfHeight, Thebullet.originBulletX, Thebullet.originBulletY);
					die();
					TweenMax.delayedCall(1, generate);
				}
				else if (collide("enemymelee", x, y) != null)
				{
					dead = true;
					graphic = spr_dead;
					var TheMelee:EnemyMelee = EnemyMelee(collide("enemymelee", x, y));
					spr_dead.angle = FP.angle(FP.halfWidth , FP.halfHeight, TheMelee.originBulletX, TheMelee.originBulletY);
					die();
					TweenMax.delayedCall(1, generate);
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
						var radian:Number=(player.angle+90+random)*Math.PI/180;
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
						shake = 0.5;
						player.play("hit");
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
						shake = 1;
					}
				}
				
				move = false;
				
				if (Input.check(Key.RIGHT)) 
				{
					if (collide("mur",x+speed,y)==null && collide("enemy",x+speed,y)==null) 
					{
						x += speed;
						move = true;
					}
					else if (collide("enemy", x + speed, y) != null && Enemy(collide("enemy", x + speed, y)).dead == true)
					{
						x += speed;
						move = true;
					}
					TweenMax.to(FP.screen, 1, { angle : 0.5 } );
				}
				else if (Input.check(Key.LEFT)) 
				{
					if (collide("mur",x-speed,y)==null && collide("enemy",x-speed,y)==null) 
					{
						x -= speed;
						move = true;
					}
					else if (collide("enemy",x-speed,y) != null && Enemy(collide("enemy",x-speed,y)).dead == true)
					{
						x -= speed;
						move = true;
					}
					TweenMax.to(FP.screen, 1, { angle : -0.5 } );
				}
				
				if (Input.check(Key.UP)) 
				{
					if (collide("mur",x,y - speed)==null && collide("enemy",x,y - speed)==null) 
					{
						y -= speed;
						move = true;
					}
					else if (collide("enemy",x,y - speed)!= null && Enemy(collide("enemy",x,y - speed)).dead == true)
					{
						y -= speed;
						move = true;
					}
					TweenMax.to(FP.screen, 1, { angle : 0 } );
				}
				else if (Input.check(Key.DOWN)) 
				{
					if (collide("mur",x,y + speed)==null && collide("enemy",x,y + speed)==null) 
					{
						y += speed;
						move = true;
					}
					else if (collide("enemy",x,y + speed) != null && Enemy(collide("enemy",x,y + speed)).dead == true)
					{
						y += speed;
						move = true;
					}
					TweenMax.to(FP.screen, 1, { angle : 0 } );
				}
				
				if (move && ! isReloading)
				{
					if(weapon == 0)
						player.play("walk");
					else
						player.play("pistol");
				}
				else if(!isReloading)
				{
					if(weapon == 0)
						player.play("idle");
					else
						player.play("pistol");
				}
				
				FP.camera.x = (x - FP.halfWidth - (FP.halfWidth - FP.screen.mouseX)/2) + ((FP.screen.mouseX) / 50);
				FP.camera.y = (y - FP.halfHeight - (FP.halfHeight - FP.screen.mouseY)/2) + ((FP.screen.mouseY) / 50);
				
				player.angle = FP.angle(FP.halfWidth , FP.halfHeight, Input.mouseX, Input.mouseY) - 90;
				
				if (shake > 0) {
					var maxNum:Number = 1;
					var minNum:Number = -1;
					var randomX:Number = ((Math.random() * (maxNum - minNum )) + minNum) * shakeAmount;
					FP.camera.x = FP.camera.x + randomX;
					var randomY:Number = ((Math.random() * (maxNum - minNum )) + minNum) * shakeAmount;
					FP.camera.y = FP.camera.y + randomY;
					shake -= FP.elapsed * decreaseFactor;
				  } 
				  else 
				  {
					shake = 0.0;
				  }
			}
			
		}
		
		public function changeAnimationWeapon():void
		{
			if (weapon == 1)
			{
				player.play("pistol");
				trace("pistol");
			}
			else
			{
				player.play("idle");
			}
		}
		
		public function die():void
		{
			
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
			/*var destX:Number = x;
			if (Level.ref.player.x > x)
				destX = x - 10;
			else if (Level.ref.player.x < x)
				destX = x + 10;*/
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
			
		}
		
		public function generate():void
		{
			Level.ref.StopMusic();
			FP.world = new Level;
		}
		
		public function FindDestionationPointde():Point
		{
			var retour:Point = new Point();
			retour.x = x + x - Level.ref.player.x + Math.random() * 30 - 30
			retour.y = y + y - Level.ref.player.y + Math.random() * 30 - 30
			return retour;
		}
		
	}

}