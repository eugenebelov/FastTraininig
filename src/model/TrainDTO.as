package model
{
	public class TrainDTO
	{
		private var exersices_c:int,
						cycles_c:int,
							time_c:int,
								status_c:int;
		
		public function TrainDTO()
		{
			
		}
		
		public function get exersices():int { return exersices_c; }
		public function get cycles():int { return cycles_c; }
		public function get currentTime():int { return time_c; }
		public function get currentStatus():int { return status_c; }
		
		public function set exersices(value_p:int):void { exersices_c = value_p; }
		public function set cycles(value_p:int):void { cycles_c = value_p; }
		public function set currentTime(value_p:int):void { time_c = value_p; }
		public function set currentStatus(value_p:int):void { status_c = value_p; }
	}
}