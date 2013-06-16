package model
{
	public class TrainingData
	{
		private var exersices_c:int,
						cycles_c:int,
							exersiceTime_c:int,
								restTime_c:int,
					exercisesKoeff:Number = 1.35;
		
		public function TrainingData()
		{
			
		}

		public function get exersices():int { return exersices_c; }
		public function get cycles():int { return cycles_c; }
		public function get exersiceTime():int { return exersiceTime_c; }
		public function get restTime():int { return restTime_c; }
		
		public function set exersices(value_p:int):void { exersices_c = value_p; }
		public function set cycles(value_p:int):void { cycles_c = value_p; }
		public function set exersiceTime(value_p:int):void { exersiceTime_c = value_p; }
		public function set restTime(value_p:int):void { restTime_c = value_p; }
		
		public function calculateWorkoutTime(restTime_p:int):Number
		{
			return Math.round(restTime_p * exercisesKoeff);
		}
		
		public function getWorkoutTime():int
		{
			return ((exersices_c * cycles_c) * exersiceTime_c) + ((exersices_c * cycles_c - 1) * restTime_c);
		}
		
	}
}