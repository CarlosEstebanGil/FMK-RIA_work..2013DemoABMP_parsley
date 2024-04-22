package Modules.ABMUsuariosPrueba.Application.bussiness.Entities.DTOs
{
	public class ABMUsuariosPruebaDTO_alta {
		private var _Usuario:String;
		private var _Password:String;
		private var _Mail:String;
		
		public function ABMUsuariosPruebaDTO_alta(Usuario:String, Password:String, Mail:String) {
			this._Usuario=Usuario;
			this._Password=Password;
			this._Mail=Mail;
		}

	    public function get Usuario():String
		{
			return _Usuario;
		}
		public function set Usuario(value:String):void
		{
			_Usuario = value;
		}
		public function get Password():String
		{
			return _Password;
		}
		public function set Password(value:String):void
		{
			_Password = value;
		}
		public function get Mail():String
		{
			return _Mail;
		}
		public function set Mail(value:String):void
		{
			_Mail = value;
		}

	}
}