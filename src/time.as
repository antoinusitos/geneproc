package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author antoine Gargasson
	 */
	public class time extends Entity 
	{
		
		public var myText:Text;
		
		public function time(x:Number=0, y:Number=0, graphic:Graphic=null, mask:Mask=null) 
		{
			super(x, y, graphic, mask);
			
		}
		
		override public function added():void 
		{
			super.added();
			
			myText = new Text("0");
			
			addGraphic(myText);
		}
		
		override public function update():void 
		{
			super.update();
			x = FP.camera.x;
			y = FP.camera.y;
		}
		
		public function setText(texte:String):void
		{
			myText.text = texte;
		}
		
	}

}