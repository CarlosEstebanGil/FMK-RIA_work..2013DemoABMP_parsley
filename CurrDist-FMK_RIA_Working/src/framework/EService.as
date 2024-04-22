package framework {
	
	import mx.collections.XMLListCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;

	// EXTENDERLA, INYECTAR domains and PMs concretos, y SOBRE-ESCRIBIR METODOS resultAction & faultAction
	
	public class EService extends HTTPService implements IService, IResponder {
		/*
		[Inject] 							//Esto mepa no se puede generalizar x inyection si o si de
		public var model:LoginGlobalModel; 	//modelos todos diferentes, no es un class con un solo
		//.execute() siempre igual xa todas las clases.. 
		
		[Inject]
		public var mainScreenModel:MainScreenModel; //idem. */
		
		//private var _url:String=""; ya existia x herencia de httpService!!
		
		private var _msgSubType:int = -1; // EMessage.NOT_USED;
		
		
// 20140427
		public function EService() {
			//resultAction=standardAction;
			this.method="POST";
		}

	/*	comento x q mepa q flex no se banca sobrecarga.. ent me quedo (elijo) 1 sola version del metodo..
		public function execute():AsyncToken {
			 	execute(this._url);	
		}*/
		
		// ------------------------------------------------------------------------------------------



		  public function execute(strUrl:String):void { //AsyncToken { // Override this method
			//return null;
			//throw new Error( "Abstract method" );
			url = strUrl;
			this.resultFormat="e4x";
			
			var call:AsyncToken=this.send();
			call.addResponder(this);
			
			//return null;
		}
		// ------------------------------------------------------------------------------------------
		
		//IResponder:
		
		  public function result(data:Object):void {
			var evento:ResultEvent = data as ResultEvent;
			
			var dataXML:XMLList = XML(evento.result)..item; //20160825 vuelvo a poner item ya q modifiqué el xml (asi sirve acá poner item y asi funciona generico) XML(evento.result)..dominios; //20160824 ..item;
			
			var dataXMLCollection:XMLListCollection=new XMLListCollection(dataXML);
			
			//new 20140427
			
			//-- new 20140424: Lo hago contempla "multiSvc" xa def <>s on result  action algorithms:
			
			resultAction(dataXMLCollection);
			
			//resultAction(dataXMLCollection);
			/* Como usé ptro a funciones no necesito todo este switch!!! 
			// en realidad si necesito el case pero no lo voy a necesitar pero x otro motivo y es
			// q los action los voy a definir en los commands! y ent ahi si seteo el action como
			//handler y listo.. 
			switch (this._msgSubType)  { // podia haber usado puntero a funciones!!
				
				case EMessage.NOT_USED:
					
					executeStandardAlgorithm(..)
					break;
				
				case EMessage.ALTA:
					executeAltaAlgorithm(..)
					break;
				
				case EMessage.BAJA:
					...idem (baja action)..
					break;
				
				case EMessage.MODIF:
					...idem (modif action)..
					break;
				
				case EMessage.CONSULTA:
					...idem (consulta action)..
					break;
				
			} */
				
			
			//-- new 20140424
			
			//model.userData=new XMLListCollection(dataXML); //actualiza el modelo + extra:
			
			// -> extra:debería dispatchear (generar y disparar) un evento parsley , el cual
			// 			debería estar registrado en la app ppal y ligado a un command 
			//			este evt/msg llevaría la data del user yel resultado como dto en el mismo
			//			msge rtado de login (loginResultMsge) y en base a eso el command de la app
			//			ppa sabrá que hacer ( un if etc etc .. ) :)
		}
		  
		  //getters y setters del subtype del msge xa poder definir distintos algoritmos de ejec o iResponders.. 
		  public function getEMSGiSubType():int {
			  return this._msgSubType;
		  }
		  public function setEMSGiSubType(msgSubType:int):void {
			  this._msgSubType = msgSubType;
		  }
		  
		// SOBRE-ESCRIBIR ESTE METODO ------------------------------------------------------------------
		//20140427
		  private var _resultAction:Function= standardAction; //null; //standardAction; //20140424 new: ptro funcs ver si funca!!!
		
		  private var _faultAction:Function= standardFaultAction;
		  
		 //standard impl: ( not provide, define action si o si )
		 public function standardAction(dataXMLCollection:XMLListCollection):void { // (data:Object):void {  //directly works with result as XMLListCollection
			//var dataXMLCollection:XMLListCollection = data as XMLListCollection;
			throw new Error( "Abstract method" ); //U must Override only  this result action method !!!!
			// inject domains and presentation models in your extended class and put logic code here to
			// update that models/pm -> views (via db ) etc....
		}
		// ---------------------------------------------------------------------------------------------
		
		 public function fault(info:Object):void {
			var evento:FaultEvent = info as FaultEvent;
			faultAction(evento);
			//Alert.show(evento.fault.message,evento.fault.faultDetail); */
			 
		}
		
		 public function standardFaultAction(evento:FaultEvent):void { //provides standard. override it as you want. 
			//Alert.show(evento.fault.message,evento.fault.faultDetail); //change to log..
			 throw new Error( "Abstract method" ); //idem standardAction()..
		}
		
		 //ya la posee x herencia de la clase HttpService de flex ..
		 /*public function get url():String {
			return _url;
		}
		
		public function set url(urlString:String):void {
			_url = urlString;
		}*/
		 
		 public function alta(strUrl:String):void {
			 // TODO Auto Generated method stub
			 execute(strUrl); // como impl x defecto llaman c/su url especifica al mismo execute q hace svc.send 1-1 y listo.
		 }					 // creé estas funcs x separado x si la logica de alta no usa svc o usa + de 1 o en sintesis si difiere a lo standard de svc y 1-1
		 
		 public function baja(strUrl:String):void { //idem 
			 // TODO Auto Generated method stub
			 execute(strUrl); // impl x defecto override for different algorithm .. 
		 }
		 
		 public function consulta(strUrl:String):void { //idem
			 // TODO Auto Generated method stub
			 execute(strUrl); // impl x defecto override for different algorithm .. 
		 }
		 
		 public function modif(strUrl:String):void { //idem
			 // TODO Auto Generated method stub
			 execute(strUrl); // impl x defecto override for different algorithm .. 
 		 }
		 
		 public function get resultAction():Function
		 {
			 // TODO Auto Generated method stub
			 var f:Function;
			 try {
				 f= this._resultAction; 
			 } 
			 catch(error:Error) {
				 trace("error en EService -> resultAction method! ");
				 f= null;
			 }
			 finally {
			 	return f;
			 }
		 }
		 
		 public function set resultAction(value:Function):void {
			 // TODO Auto Generated method stub
			 try {
				 this._resultAction=value;	 
			 } 
			 catch(error:Error) {
				 trace("error en EService -> resultAction method! ");
			 }
		 }
		 
		 public function get faultAction():Function {
			 // TODO Auto Generated method stub
			 var f:Function;
			 try {
				 f= this._faultAction; 
			 } 
			 catch(error:Error) {
				 trace("error en EService -> faultAction method! ");
				 f= null;
			 }
			 finally {
				 return f;
			 }
		 }
		 
		 public function set faultAction(value:Function):void {
			 // TODO Auto Generated method stub
			 try {
				 this._faultAction=value;	 
			 } 
			 catch(error:Error) {
				 trace("error en EService -> faultAction method! ");
			 }
		 }
		 
		 
	}
}