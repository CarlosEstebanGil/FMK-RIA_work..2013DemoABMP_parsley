package Modules.ABMUsuariosPrueba.Application.presentationModel
{
	import Modules.ABMUsuariosPrueba.Application.bussiness.Entities.DTOs.ABMUsuariosPruebaDTO_alta;
	import Modules.ABMUsuariosPrueba.Application.bussiness.Entities.DTOs.ABMUsuariosPruebaDTO_baja;
	import Modules.ABMUsuariosPrueba.Application.domain.ABMUsuariosPruebaGlobalModel;
	
	import framework.EMessage;
	
	import mx.collections.XMLListCollection;

	public class MainScreenModel {  

		[Inject]
		[Bindable]
		public var model:ABMUsuariosPruebaGlobalModel;
		
		[Bindable]
		public var xmllcUsuariosPrueba:XMLListCollection;  
		
		[Bindable]
		public var delParam1:String="";
		
		[Bindable]
		public var delParam2:String="";

		[Bindable]
		public var txtTmpText:String;
		
		[Bindable]
		public var txtUsuario:String="";
		
		[Bindable]
		public var txtPassword:String="";
		
		[Bindable]
		public var txtMail:String="";

		
		
		[MessageDispatcher]
		public var sendMessage:Function;  
		
		public  function sendDeleteRequestMSG(typeParam:int, abmUsuariosPruebaDTO_baja:ABMUsuariosPruebaDTO_baja):void {
			 
			var deleteRequestMessage:EMessage= new EMessage(typeParam);

			deleteRequestMessage.data=abmUsuariosPruebaDTO_baja;
			
			deleteRequestMessage.subtype=EMessage.BAJA;
			
			sendMessage(deleteRequestMessage); 
		}

		public  function sendAltaRequestMSG(typeParam:int, abmUsuariosPruebaDTO_alta:ABMUsuariosPruebaDTO_alta):void {
			
			var altaRequestMessage:EMessage= new EMessage(typeParam);
			
			altaRequestMessage.data=abmUsuariosPruebaDTO_alta;
			
			altaRequestMessage.subtype=EMessage.ALTA;
			
			sendMessage(altaRequestMessage); 
		}

		
		public  function sendConsultaRequestMSG(typeParam:int):void {  //, abmPersDTO_baja:ABMPersDTO_baja):void {
			
			var consultaRequestMessage:EMessage= new EMessage(typeParam);
			
			consultaRequestMessage.subtype=EMessage.CONSULTA;
			
			sendMessage(consultaRequestMessage); 
		}
		
		
		public function MainScreenModel(){
		}
		
	} 
	
}