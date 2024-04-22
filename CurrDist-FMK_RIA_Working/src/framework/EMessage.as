package framework
{
	public class EMessage implements IMessage
	{
		//public static const LOGIN_REQUEST_MESSAGE:int
		
		/* Al pedo, la kte la tienen q poner si o si en cada clase concreta de mensaje q se crea
			ya q se necesita que el "id del mensaje" sea de clase (static) xa poder usarlo en 
			el archivo de configuracion mxml:objects.
		
		private var _MESSAGE_ID:int=-1 // overload this var in each real/concrete message class
		
		public function get MESSAGE_ID():int { //returns "const" MESSAGE_ID of the concrete Class
			return _MESSAGE_ID;
		}
		*/
		
		/* public function set MESSAGE_ID(value:int):void {
			_MESSAGE_ID = value;
		}	*/
		
		public var _type:int= -1; //NOT_USED;  //-1;

		public var _subtype:int=-1; // NOT_USED;

		
		public function EMessage(type:int) {
			this._type = type;
		}
		
	
		[Selector]	
		public function get type():int {
			return _type;
		}
		
		
		
		/*public function set type(typeParam:int):void {
			this.type = typeParam;
		}*/
		
		private var _data:Object=null;
		
		public function get data():Object {
			return this._data;
		}
		
		public function set data(value:Object):void {
			this._data=value;
		}
		
		public function get subtype():int {
			// TODO Auto Generated method stub
			return _subtype; 
		}
		
		public function set subtype(iSubTypeParam:int):void {
			this._subtype=iSubTypeParam;
		}

		// ktes q junto a la var subType actuan como mensaje subdividido xa invocar mediante 
			// este solo mensaje distintas funciones de una misma clase de servicios relacionados
			// svcPersonas.alta/.baja etc etc ( el cmd.execute del api redefine el execute 
			// segun estas constantes invoca c/metodo de nombre similar prefijado x una interfase
			// de iService especializada o la misma q ya venia usando.. 
		
		//se definen acá x q en IMsge no se pueden definir const en interfases total se referencia
		//Emsge.Kte en cualquier lugar y listo se usan sin instanciar emessage ni nada. (simil utilitario)
		public static const ALTA:int =1;
		public static const BAJA:int =2;
		public static const MODIF:int =3;
		public static const CONSULTA:int =4; 
		public static const NOT_USED:int =-1; 
		
	}
}