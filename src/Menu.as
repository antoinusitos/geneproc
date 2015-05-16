package  
{
	import flash.events.TextEvent;
	import flash.system.System;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class Menu extends World 
	{
		
		public var music:Sfx  = new Sfx (Embed.MENUSOUND);
		public var logo:Image  = new Image (Embed.MENU);
		public var consigne:Text;
		public var visibletime:Number = 0;
		
		public function Menu() 
		{
			super();
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			FP.screen.color = 0x000000;
			
			var title:Text = new Text("PROCEDURAL MIAMI", 0, FP.screen.height / 4, {size:20});
			title.x = FP.screen.width / 2 - title.width / 2;
			
			consigne = new Text("PRESS SPACE TO START", 0, Text.size);
			consigne.x = FP.screen.width / 2 - consigne.width / 2;
			
			var name:Text = new Text("Antoine Gargasson - 2015", 0, FP.screen.height - Text.size, {size:10});
			
			logo.x = FP.width / 2 - logo.width/2;
			logo.y = FP.height / 2 - logo.height /2;
			
			addGraphic(logo);
			//addGraphic(title);
			addGraphic(consigne);
			addGraphic(name);
			
			
			music.play();
			music.loop();
		}
		override public function update():void 
		{
			super.update();
			
			visibletime ++;
			
			if (Input.check(Key.SPACE))
			{
				music.stop();
				FP.world = new Level;
			}
			if (Input.check(Key.ESCAPE))
			{
				System.exit(0)
			}
			
			if (visibletime > 60)
			{
				consigne.visible = !consigne.visible;
				visibletime = 0;
			}
		}
		
	}

}