package Modules.ABMUsuariosPrueba.Application.bussiness.Entities.DTOs
{
	public class ABMUsuariosPruebaDTO_baja {
		private var _Usuario:String;
		private var _Password:String;
		
		public function ABMUsuariosPruebaDTO_baja(Usuario:String, Password:String) {
			this._Usuario=Usuario;
			this._Password=Password;
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

	}
}