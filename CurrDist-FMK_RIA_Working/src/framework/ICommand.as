package framework
{
	public interface ICommand {
		function execute(mensaje:IMessage):void  //(strUrl:String):void // (mensaje:IMessage):void 
		function set url(strUrl:String):void
		function get url():String
		function getService():IService	
	}
}