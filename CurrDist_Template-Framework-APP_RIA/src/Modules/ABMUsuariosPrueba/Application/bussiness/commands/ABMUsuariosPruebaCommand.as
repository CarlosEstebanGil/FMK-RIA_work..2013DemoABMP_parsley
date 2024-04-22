package Modules.ABMUsuariosPrueba.Application.bussiness.commands
{
	
	
	import Modules.ABMUsuarios.Application.bussiness.Entities.DTOs.ABMUsuariosPruebaDTO_alta;
	import Modules.ABMUsuariosPrueba.Application.bussiness.Entities.DTOs.ABMUsuariosPruebaDTO_baja;
	import Modules.ABMUsuariosPrueba.Application.presentationModel.MainScreenModel;
	
	import application.domain.GlobalModel;
	
	import framework.ECommand_ABM;
	import framework.EService;
	import framework.IService;
	
	import mx.collections.XMLListCollection;
	import mx.rpc.events.FaultEvent;
	
	public class ABMUsuariosPruebaCommand extends ECommand_ABM {
		
		[Inject]
		[Bindable]
		public var model:GlobalModel;
		
		[Inject]
		[Bindable]
		public var pmModel:MainScreenModel;
		
		
		[Inject (id="ABMUsuariosSvc")]	
		public var svc:IService; 	
		
		override public function getService():IService {
			return this.svc;  
		}
		
		public function ABMUsuariosPruebaCommand() {
			super();
		}
		
		
		
		//-------------------------------------BAJA-------------------------------------
		override public function bajaAction(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			pmModel.txtTmpText="BAJA Usuarios EFECTUADA CON EXITO"; 	
		}
		override public function getURLBaja():String {
			return model.servicios.bajaUsuarios; 
		}
		override public function bajaFault(evento:FaultEvent):void {
			pmModel.txtTmpText="ERROR en BAJA Usuarios!"; 
		}
		override public function completedParametersString_Baja():String{
			var abmUsuariosPruebaDTO_baja:ABMUsuariosPruebaDTO_baja= this.message.data as ABMUsuariosPruebaDTO_baja;
			return "&nameToDel1=" + abmUsuariosPruebaDTO_baja.Usuario + "&nameToDel2=" + abmUsuariosPruebaDTO_baja.Password;
		} 
		
		//-------------------------------------ALTA-------------------------------------
		override public function altaAction(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			pmModel.txtTmpText="ALTA Usuarios EFECTUADA CON EXITO"; 	
		}
		override public function getURLAlta():String {
			// return model.servicios.altaUsuarios;
			return "http://tecnocodigo.myftp.org/bioargenta/funciones/InsertTest.php?x=1";
			
		}
		override public function altaFault(evento:FaultEvent):void {
			pmModel.txtTmpText="ERROR en ALTA Usuarios!"; 
		}
		override public function completedParametersString_Alta():String{
			var abmUsuariosPruebaDTO_alta:ABMUsuariosPruebaDTO_alta = this.message.data as ABMUsuariosPruebaDTO_alta;
			return "&txtUsuario=" + abmUsuariosPruebaDTO_alta.Usuario + "&txtPassword=" + abmUsuariosPruebaDTO_alta.Password + "&txtMail=" + abmUsuariosPruebaDTO_alta.Mail;
		}
		//-------------------------------------MODIF-------------------------------------
		
		//-------------------------------------CONS-------------------------------------
		
		override public function consultaAction(data:Object):void { //(dataXMLCollection:XMLListCollection):void {
			//pmModel.txtTmpText="CONSULTA PERSONA/S EFECTUADA CON EXITO";
			//actualizar el modelo
			pmModel.xmllcUsuarios=EService.getResultAsXMLListCollection(data);
		}
		override public function getURLConsulta():String {
			//return model.servicios.getPers;
			return "http://tecnocodigo.myftp.org/bioargenta/funciones/getTodosLosClientes.php";
		}
		
		override public function consultaFault(evento:FaultEvent):void {
			pmModel.txtTmpText="!! ERROR en Consulta Usuario/s !!"; 
		}
		
		override public function completedParametersString_Cons():String {
			 return ""; 
			// return "&reqParam1=2&reqParam2=9&reqParam3=5";
		} 
		
	}
	
}