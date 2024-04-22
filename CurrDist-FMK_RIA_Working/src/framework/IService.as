package framework
{
	import mx.rpc.AsyncToken;

	public interface IService { //saco el q extienda executable x q executable ya tiene .execute() 
		//	extends IExecutable { // y entonces trae problemas x q flex no soporta sobrecarga !!!!!!
		//function execute():AsyncToken Mepa q flex no se banca sobrecarga ..!!!
		
		//function execute(strUrl:String):AsyncToken
		
		function execute(strUrl:String):void // (mensaje:IMessage):void 
			
		//funciones para abmc standar..  mepa q no hace falta x q usé ptro a funcs!,.,
			// ojo no confundir con los actions de c/u (xa eso no necesito n funcs predef x q usé 
				// ptro a funcs! ..
		function alta (strUrl:String):void 
		function baja(strUrl:String):void 
		function modif(strUrl:String):void 
		function consulta(strUrl:String):void 
		
		function getEMSGiSubType():int;  //xa q la clase service si es xa abm ent pueda switchear y asi
											// definir q algoritmo xa onResult ejecutar!.. 
		
	    function get resultAction():Function;
		
		function set resultAction(value:Function):void;
		
		function get faultAction():Function;
		
		function set faultAction(value:Function):void;
		
		
		//function set uri(strUri:String):void //la clase HttpService de flex ya la posee ..
	}									// xero la volvi a habilitar xa ECommand q no tiene url..
										// xero la volví a sacar xq IService debia ser con exec(strUrl) nomas!
}