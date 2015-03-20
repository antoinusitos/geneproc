package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author bsg
	 */
	public class Main extends Engine
	{
		
		public var niv:Level;
		
		public function Main():void 
		{
			super(400, 300, 60, false);
			
			niv = new Level;
			
			FP.world = niv;
			FP.screen.scale = 2;
		}
		
	}
	
}