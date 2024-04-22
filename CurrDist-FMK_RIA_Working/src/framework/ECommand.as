 package framework
{
	//import Modules.Login.Application.messages.MensajePruebaTmp;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.AsyncToken;
	
	// Extend this class. Inject real concrete service class & nothing more ( .execute() will run auto..)
	// Or you can override execute's methods with some logic different to only execute the service logic!.
	//20160825 public class ECommand implements ICommand { //IService
	public class ECommand extends EventDispatcher implements ICommand { //IService
		/*private var _url:String;
		public function set url(strUrl:String):void {
			this._url = strUrl;
		}*/
		
		private var _url:String;
		public function set url(strUrl:String):void {
			this._url = strUrl;
		}
		public function get url():String {
			return this._url; 
		}
		
		private var _message:IMessage;
		public function set message(messageParam:IMessage):void {
			this._message = messageParam;
		}
		public function get message():IMessage{
			return this._message;
		}
		
		
		//public var svc:IService;
		
		// [Inject]	 Mepa q esto no se puede generalizar..... !!!!!!!!!!!!!!
		//public var svc:IService;
		
		/* Al pedo un const q reciba como param un obj svc q debe ser injectado y no se puede inject dynamicamente
		public function ECommand(svcParam:IService) {
			this.svc = svcParam
		} x eso cambio a constructor vacio: */
		public function ECommand() {
			
		}
		//OJO.. SI Parsley necesita el tipo de clase específica como argumento ent todo esto ya fué!
		//public function execute(mensaje:LoginRequestMessage):void {  //*):void {
		// ----------------------------------------------------------------------------------------------
		 public function execute(mensaje:IMessage):void { //MensajePruebaTmp):void {  //mensaje:IMessage ):void { //*):void {
			 this.message=mensaje;

			 //20160825 Esta version vieja no seteaba el action ni el fault ent se usaban las impl standard de eservice 
			 //pero nunca un action y fault del comando (?) !!! LO PONGO ENTONCES YO QUE SÉ.. q raro n o estuviera.. :s 
			 
			getService().faultAction=fault; //20160825 --> el svc ya estaba creado y x def sus standardFuncs PERO ..
			getService().resultAction=action; // .. acá se las sobreEscribo con las del cmdPostaFinalApp y el svc ejecutará esas!!
			 
			getService().execute(url + completedParametersString() );
			 //svc.execute(_url);//(this.url) ; // la url la puedo obtener desde el msge x ej!. o armar esto x partes?
		}
		
		 public function completedParametersString():String {
			 return "";
		 } 
		 
		 public function getService():IService {
		 	throw Error("Abstract method");
		 } 
		 
		 //----------- 20160825 faltaba esto !!! 00 ( muy vieja esta version en q me basé parece..)
		 public function action(data:Object):void {  //dataXMLCollection: XMLListCollection):void {
			 throw new Error( "Abstract method" );
		 }
		 public function fault(data:Object):void { //dataXMLCollection:XMLListCollection):void {
			 throw new Error( "Abstract method" ); //-> me obligan a sobreescribirlas pero q existan ent el func onda esqueleto funciona..
		 }
		 
		 // ----------------------------------------------------------------------------------------------
		
		 /*	comento x q mepa q flex no se banca sobrecarga.. ent me quedo (elijo) 1 sola version del metodo..
		 
		 public function execute(messageParam:IMessage, strUrl:String):AsyncToken {
			url = strUrl;
			svc.execute(messageParam) ;
		}
		
		 public function execute():void {
			execute(this.message,this.url)
		}
			
		 public function execute(strUrl:String):AsyncToken {
			svc.execute(strUrl) ;
		} 
		
		 */
	}
} 