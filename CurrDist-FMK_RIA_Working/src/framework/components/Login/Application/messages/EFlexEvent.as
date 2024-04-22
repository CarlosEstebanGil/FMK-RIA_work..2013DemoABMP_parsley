package framework.components.Login.Application.messages
{
	import flash.events.Event;
	
	import mx.events.FlexEvent;
	
	public class EFlexEvent extends Event {//FlexEvent {
		
		private var _data:Object=null;
		
		public function get data():Object {
			return this._data;
		}
		
		public function set data(value:Object):void {
			this._data=value;
		}
		
		public function EFlexEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
	}

}