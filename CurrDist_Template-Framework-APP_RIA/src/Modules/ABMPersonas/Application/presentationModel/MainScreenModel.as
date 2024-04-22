package Modules.ABMPersonas.Application.presentationModel
{
	import Modules.ABMPersonas.Application.bussiness.Entities.DTOs.ABMPersonasDTO_alta;
	import Modules.ABMPersonas.Application.bussiness.Entities.DTOs.ABMPersonasDTO_baja;
	import Modules.ABMPersonas.Application.bussiness.Entities.DTOs.ABMPersonasDTO_consulta;
	import Modules.ABMPersonas.Application.bussiness.commands.ABMPersonasCommand;
	import Modules.ABMPersonas.Application.domain.ABMUsuariosGlobalModel;
	import Modules.ABMPersonas.Application.view.MainScreen;
	
	import flash.events.EventDispatcher;
	
	import framework.EMessage;
	import framework.components.EComboBox;
	import framework.components.EDateField;
	import framework.components.ERadioButton;
	
	import mx.collections.ArrayList;
	import mx.collections.XMLListCollection;
	import mx.events.FlexEvent;
	import mx.formatters.DateFormatter;
	
	//import spark.components.ComboBox;

	public class MainScreenModel extends EventDispatcher {  

		//20160805
		public var msPtr:MainScreen;
		
		/* [Inject]
		[Bindable]
		public var model:ABMUsuariosGlobalModel;
		*/
		
		
		
		[Bindable]
		//20161026 public var txtIdUsuario:String="ID Usuario de prueba";
		public var txtNombrePersona:String="";
		
		[Bindable]
		//20161026 public var txtUsuario:String="Usuario de Prueba";
		public var txtApellidoPersona:String="";
		
		[Bindable]
		public var txtClave:String="";
		
		[Bindable]
		public var xmllcUsuarios:XMLListCollection;  
		
		private var _cmbIndexCli:int=0;
		
		[Bindable]
		public var cmbCli:Array=[];
		
		/*20160508 
		[Bindable]
		public var cmbSectores:Array=[];
		
		[Bindable]
		public var cmbFunciones:Array=[];
		
		[Bindable]
		public var cmbGrupoExpo:Array=[];
		
		[Bindable]
		public var grpTipo:String="Sistema";
		
		[Bindable]
		public var dtfActivacion:String=showCurrentDateTime();
		
		[Bindable]
		public var txtNombre:String="";
		
		[Bindable]
		public var txtApellido:String="";
		
		[Bindable]
		public var txtMail:String="";
		
		[Bindable]
		public var cmbActivado:Array=[];
		
		[Bindable]
		public var cmbDeshbilitado:Array=[];
		
		[Bindable]
		public var cmbPINCMostrar:Array=[];
		
		[Bindable]
		public var txtBatMymtec:String="";
		
		[Bindable]
		public var txtUsuarioRed:String="";
		
		[Bindable]
		public var cmbRecordatorios:Array=[];
		
		[Bindable]
		public var cmbAccesoBuzon:Array=[];
	
		*/
		
		[Bindable]
		public var txtTmpText:String="";

		
		public static const SETEAR_COMBO_CLI:String="SETEAR_COMBO_CLI";
		
		[Bindable]
		public function get cmbIndexCli():int
		{
			return _cmbIndexCli;
		}

		public function set cmbIndexCli(value:int):void
		{
			_cmbIndexCli = value;
			dispatchEvent(new FlexEvent(SETEAR_COMBO_CLI));
		}

		/*20160805	
		[MessageDispatcher]
		public var sendMessage:Function;  
		*/
		
		/*20160805	public function showCurrentDateTime():String
		{
			var currentDateTime:Date = new Date();
			var dateTimeFormat:DateFormatter = new DateFormatter;
			dateTimeFormat.formatString = "DD/MM/YYYY";
			return dateTimeFormat.format(currentDateTime);
		}

		public  function sendDeleteRequestMSG(typeParam:int, abmUsuariosDTO_baja:ABMUsuariosDTO_baja):void {
			 
			var deleteRequestMessage:EMessage= new EMessage(typeParam);

			deleteRequestMessage.data=abmUsuariosDTO_baja;
			
			deleteRequestMessage.subtype=EMessage.BAJA;
			
			sendMessage(deleteRequestMessage); 
		}

		public  function sendAltaRequestMSG(typeParam:int, abmUsuariosDTO_alta:ABMUsuariosDTO_alta):void {
			
			var altaRequestMessage:EMessage= new EMessage(typeParam);
			
			altaRequestMessage.data=abmUsuariosDTO_alta;
			
			altaRequestMessage.subtype=EMessage.ALTA;
			
			sendMessage(altaRequestMessage); 
		} */

		public var cmdABMPersonasCommand:ABMPersonasCommand; //20160805 
		
		public  function sendConsultaRequestMSG(typeParam:int, abmPersonasDTO_consulta:ABMPersonasDTO_consulta):void {  //, abmPersDTO_baja:ABMPersDTO_baja):void {
			try
			{
				var consultaRequestMessage:EMessage= new EMessage(typeParam);
				
				consultaRequestMessage.data=abmPersonasDTO_consulta;
				
				consultaRequestMessage.subtype=EMessage.CONSULTA;
				
				/*20160805 sendMessage(consultaRequestMessage); */
				cmdABMPersonasCommand=new ABMPersonasCommand();
				cmdABMPersonasCommand.pmModel=this;
				cmdABMPersonasCommand.execute(consultaRequestMessage);
			} 
			catch(error:Error) 
			{
				trace(error.message);
			}
		}
		
		//20161026
		public  function sendAltaRequestMSG(typeParam:int, abmPersonasDTO_alta:ABMPersonasDTO_alta):void {  //, abmPersDTO_baja:ABMPersDTO_baja):void {
			try
			{
				var altaRequestMessage:EMessage= new EMessage(typeParam);
				
				altaRequestMessage.data=abmPersonasDTO_alta;
				
				altaRequestMessage.subtype=EMessage.ALTA;
				
				/*20160805 sendMessage(consultaRequestMessage); */
				cmdABMPersonasCommand=new ABMPersonasCommand();
				cmdABMPersonasCommand.pmModel=this;
				cmdABMPersonasCommand.execute(altaRequestMessage);
			} 
			catch(error:Error) 
			{
				trace(error.message);
			}
		}

		//20161026
		public  function sendBajaRequestMSG(typeParam:int, abmPersonasDTO_baja:ABMPersonasDTO_baja):void {  //, abmPersDTO_baja:ABMPersDTO_baja):void {
			try
			{
				var bajaRequestMessage:EMessage= new EMessage(typeParam);
				
				bajaRequestMessage.data=abmPersonasDTO_baja;
				
				bajaRequestMessage.subtype=EMessage.BAJA;
				
				/*20160805 sendMessage(consultaRequestMessage); */
				cmdABMPersonasCommand=new ABMPersonasCommand();
				cmdABMPersonasCommand.pmModel=this;
				cmdABMPersonasCommand.execute(bajaRequestMessage);
			} 
			catch(error:Error) 
			{
				trace(error.message);
			}
		}
		
		public function MainScreenModel(){
		}
		
	} 
	
}