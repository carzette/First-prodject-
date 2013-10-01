package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jag
	 */
	public class Star extends Sprite 
	{
		
		public function Star() 
		{
			
		}
		
		private function draw()
		{
			self.graphics.beginFill(0xFFFF00);
			self.graphics.moveTo(150,25);
			self.graphics.lineTo (179,111);
			self.graphics.lineTo (269,111);
			self.graphics.lineTo (197, 165);
			self.graphics.lineTo(223,251);
			self.graphics.lineTo(150,200);
			self.graphics.lineTo(77,251);
			self.graphics.lineTo(103,165);
			self.graphics.lineTo(31,111);
			self.graphics.lineTo(121,111);
			self.graphics.endFill();
			self.scaleX = selfscale;
			self.scaleY = selfscale;
			self.buttonMode = true;
		}
		
	}

}