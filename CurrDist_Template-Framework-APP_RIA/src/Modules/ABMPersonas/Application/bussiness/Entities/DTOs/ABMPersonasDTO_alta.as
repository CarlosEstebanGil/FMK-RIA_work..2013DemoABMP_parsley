package Modules.ABMPersonas.Application.bussiness.Entities.DTOs
{
	public class ABMPersonasDTO_alta {
		//private var	id:int;
		private var	_nombre:String;
		private var	_apellido:String;
		private var	_edad:int;
		
		public function ABMPersonasDTO_alta(nombre:String, apellido:String, edad:int) { //(id:String, nombre:String, apellido:String, edad:int) {
			//this.id=id;
			this.nombre=nombre;
			this.apellido=apellido;
			this.edad=edad;
		}
		

		public function get edad():int
		{
			return _edad;
		}

		public function set edad(value:int):void
		{
			_edad = value;
		}

		public function get apellido():String
		{
			return _apellido;
		}

		public function set apellido(value:String):void
		{
			_apellido = value;
		}

		public function get nombre():String
		{
			return _nombre;
		}

		public function set nombre(value:String):void
		{
			_nombre = value;
		}

	}
}