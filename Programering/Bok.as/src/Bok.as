package  
{
	/**
	 * ...
	 * @author Jag
	 */
	public class Bok 
	{
		private var titel:String;
		private var farfattare:String;
		private var sidor:int;
		
		public function Bok() 
		{
			
		}
		
		public function setTitel(newTitle:String ):void 
		{
			titel = newTitle;
			
		}
		public function setFarfattare(newFar):void
		{
			farfattare = newFar;
		}
		
		public function setSidor(newSidor):void 
		{
			sidor = newSidor;
		}
	}

}