package framework 
{
	import framework.IMessage;
	
	import mx.collections.XMLListCollection;
	import mx.rpc.events.FaultEvent;

	public class ECommand_ABM extends ECommand implements IABMCommand {
		
	/*	public function ECommand_ABM() {
			super();
		} */
		private var msgReceived:IMessage;
		
		public function altaAction(dataXMLCollection:XMLListCollection):void {
			// TODO Auto Generated method stub 	
		}
		
		public function bajaAction(dataXMLCollection:XMLListCollection):void {
			// TODO Auto Generated method stub	
		}
		
		public function consultaAction(dataXMLCollection:XMLListCollection):void {
			// TODO Auto Generated method stub
		}
		
		public function modifAction(dataXMLCollection:XMLListCollection):void {
			// TODO Auto Generated method stub	
		}
		
	
		
		 override public function execute(messageParam:IMessage):void {
			 
			this.msgReceived = messageParam;
			this.message=msgReceived; 
			switch (messageParam.subtype)  {
				
				case EMessage.NOT_USED:
					//getService().resultAction = .. ; // ->qda el standarAction de la clase
						// igual no deberia estar en ECmdABM y q subType sea nada, no deberia entrar acá.
					getService().execute(url); //STANDARD SVC.Execute (1-1)(cmd-svc)
					break;

				case EMessage.ALTA:
					getService().resultAction = altaAction;
					getService().alta(getURLAlta());
					getService().faultAction = altaFault;
					break;

				case EMessage.BAJA:
					getService().resultAction = bajaAction;
					getService().baja(getURLBaja());
					getService().faultAction = bajaFault;
					break;

				case EMessage.MODIF:
					getService().resultAction = modifAction;
					getService().modif(getURLModif());
					getService().faultAction = modifFault;
					break;

				case EMessage.CONSULTA:
					getService().resultAction = consultaAction;
					getService().consulta(getURLConsulta());
					getService().faultAction = consultaFault;
					break;

			}
				
		}
		 
		 /* Mepa q no lo puedo poner aca x q la var svc debe definirse junto con la injeccion
		 	x eso lo dejo para las clases concretas.. 
		 override public function getService():IService {
			 return this.svc; // = svcParam
		 } */
		 
		 //importante redefinicion para abm (<>s urls de servicio):
		 override public function get url():String {
			 var r:String=null;
			 try {
				 switch (msgReceived.subtype)  { //(messageParam.subtype)  {
					 
					 case EMessage.NOT_USED:
						 r= url; //STANDARD SVC.Execute (1-1)(cmd-svc)
						 break;
					 
					 case EMessage.ALTA:
						 r=getURLAlta();
						 break;
					 
					 case EMessage.BAJA:
						 r=getURLBaja();
						 break;
					 
					 case EMessage.MODIF:
						 r=getURLModif();
						 break;
					 
					 case EMessage.CONSULTA:
						 r=getURLConsulta();
						 break;
				 }

			 } 
			 catch(error:Error) {
				 trace(error.message);
			 }
			 finally{
				 return r;				
			 }
			 
		 }	
		 
		 /*override public function getService():IService {
			
		 } */
		 
		 public function getURLAlta():String {
			 // TODO OVERRIDE this method returning model.services.root.svcXXXAlta & params construction logic
			 //return null;
			 if (this.msgReceived.subtype != EMessage.NOT_USED) { 
			 	throw Error("Must Override"); 
			 }
			 return null;
		 }
		 
		 public function getURLBaja():String {
			 // TODO OVERRIDE this method returning model.services.root.svcXXXBaja & params construction logic
			 //return null;
			 if ( this.msgReceived.subtype != EMessage.NOT_USED ) { 
			 	throw Error("Must Override");
			 }
			 return null;
		 }
		 
		 public function getURLConsulta():String {
			 // TODO OVERRIDE this method returning model.services.root.svcXXXConsulta & params construction logic
			 //return null;
			 if ( this.msgReceived.subtype != EMessage.NOT_USED ) { 
			 	throw Error("Must Override");
			 }
			 return null;
		 }
		 
		 public function getURLModif():String {
			 // TODO OVERRIDE this method returning model.services.root.svcXXXModif & params construction logic
			 //return null;
			 if ( this.msgReceived.subtype != EMessage.NOT_USED ) {
			 	throw Error("Must Override");
			 }
			 return null;
		 }
		 
		 public function altaFault(evento:FaultEvent):void {
			 // TODO Auto Generated method stub 
		 }
		 
		 public function bajaFault(evento:FaultEvent):void {
			 // TODO Auto Generated method stub 
		 }
		 
		 public function consultaFault(evento:FaultEvent):void {
			 // TODO Auto Generated method stub 
		 }
		 
		 public function modifFault(evento:FaultEvent):void {
			 // TODO Auto Generated method stub
		 }
		 
	}
}