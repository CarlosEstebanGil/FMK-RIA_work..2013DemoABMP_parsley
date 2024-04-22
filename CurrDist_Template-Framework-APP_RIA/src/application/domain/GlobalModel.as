package application.domain 
{
	import mx.collections.XMLListCollection;

	public class GlobalModel
	{
		//20160805 [Bindable] Bindable no es xa inyectarla sino que un observer interno de flex qda a la escucha de sus modifs xa evts y autoUpds
		//en los lugares donde referencien con {} a esta var que está def como bindable ( serian los q escuchan a esta var x sus cambios)
		public static var servicios:Object; 
		
		
		//20160805 [Bindable]
		public static var loginResult:Boolean=false;  
		
		 
		 	
		public function GlobalModel() {
			
		}
	}
}