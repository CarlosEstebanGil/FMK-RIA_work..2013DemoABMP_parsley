package framework
{
	import mx.collections.XMLListCollection;
	import mx.rpc.events.FaultEvent;

	public interface IABMCommand {
		/*function alta(mensaje:IMessage):void  //(strUrl:String):void // (mensaje:IMessage):void 
		function baja(strUrl:String):void
		function modificacion():String
		function consulta():IService	*/
		
		function getURLAlta():String
		function getURLBaja():String
		function getURLModif():String			
		function getURLConsulta():String	
			
		//20140424: TODO : DEJAR EL TIPO DEVUELTO ORIGINAL MEJOR... 	
		function altaAction(dataXMLCollection:XMLListCollection):void
		function bajaAction(dataXMLCollection:XMLListCollection):void
		function modifAction(dataXMLCollection:XMLListCollection):void		
		function consultaAction(dataXMLCollection:XMLListCollection):void	
			
		function altaFault(evento:FaultEvent):void 
		function bajaFault(evento:FaultEvent):void 
		function modifFault(evento:FaultEvent):void 		
		function consultaFault(evento:FaultEvent):void 	
	}
}