package Modules.ABMPersonas.Application.bussiness.Entities.DTOs
{
	public class ABMPersonasDTO_baja {
		private var _id:String;
		
		public function ABMPersonasDTO_baja(id:String) {
			this._id=id;
		}
		
	
		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

	}
}

