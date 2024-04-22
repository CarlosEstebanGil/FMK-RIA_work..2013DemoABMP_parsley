package framework
{
	public interface IMessage {
		
			
		function get type():int
		
		function get subtype():int // p/amb o division en varias peticiones a 1 solo file selector..
		function set subtype(iSubTypeParam:int):void // p/amb o division en varias peticiones a 1 solo file selector..
		
		function get data():Object
		function set data(value:Object):void
			
	}
}