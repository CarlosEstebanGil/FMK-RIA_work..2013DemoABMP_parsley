package framework.components.events
{
	import flash.events.Event;
	
	public class EAutoPopulableListCompEvent extends Event {
	
		public static const DATA_LOADED_OK:String="DATA_LOADED_OK";
		public static const DATA_LOADED_ERROR:String="DATA_LOADED_ERROR";
		
		public static const POPULATE:String="POPULATE";
		

		public static const UPDATE_SELECTED_VALUE:String="UPDATE_SELECTED_VALUE";

	//	private data:Object;
		//private 
		
		private var _cmb_Id:String;
		private var _cmb_data_value:String;
		
		public function EAutoPopulableListCompEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}

		public function get cmb_data_value():String {
			return _cmb_data_value;
		}

		public function set cmb_data_value(value:String):void {
			_cmb_data_value = value;
		}

		public function get cmb_Id():String {
			return _cmb_Id;
		}

		public function set cmb_Id(value:String):void {
			_cmb_Id = value;
		}

	}
}