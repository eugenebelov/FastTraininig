package controller
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import model.TrainDTO;
	import model.TrainingData;

	public class TrainingControl extends EventDispatcher
	{
		private var model_c:TrainingData,
						timer_c:Timer,
							cycleCounter_c:int,
								exercisesCounter_c:int,
					workTime_c:int,
						restTime_c:int,
							status_c:int;
										
		public static const HOLD:int = 0;
		public static const NEXT_EXERSICE:int = 9;
		public static const WORK:int = 10;
		public static const REST:int = 20;
		
		public function TrainingControl()
		{
			status_c = HOLD;
		}
		
		public function get model():TrainingData { return model_c; }
		public function set model(value:TrainingData):void { model_c = value; }
		
		public function get status():int { return status_c; }
		
		public function startTraining():void
		{
			cycleCounter_c = model_c.cycles;
			exercisesCounter_c = model_c.exersices;
			workTime_c = model_c.exersiceTime + 1;
			restTime_c = model_c.restTime + 1;
			
			timer_c = new Timer(1000);
			timer_c.addEventListener(TimerEvent.TIMER, onTickTimer);
			timer_c.start();
		}
		
		protected function onTickTimer(event:TimerEvent):void
		{
			if( workTime_c > 1 )
			{	
				if( status_c < WORK ) 
				{
					status_c = WORK;
					exercisesCounter_c--;
					
					trace("play sound WORK");
				}
			} 
			else
			{
				if( status_c < REST )
				{
					status_c = REST;
					
					trace("play sound WORK");
				}
			}
			
			updateStatus();
		}
		
		private function updateStatus():void
		{
			switch(status_c)
			{
				case HOLD:
				{
					
					break;
				}
				case WORK:
				{
					workTime_c--;
					
					break;
				}
				case REST:
				{
					if( restTime_c > 1 )
					{
						restTime_c--;
					}
					else
					{
						status_c = WORK;
						
						if( exercisesCounter_c == 0 )
						{
							exercisesCounter_c = model_c.exersices;
							if( cycleCounter_c > 1 )
							{
								cycleCounter_c--;
							}
							else
							{
								timer_c.stop();
								
							}
						} 
						else
						{
							exercisesCounter_c--;
						}
						
						workTime_c = model_c.exersiceTime;
						restTime_c = model_c.restTime + 1;
					}
					
					
					break;
				}
			}
			
			var trainParams:TrainDTO = new TrainDTO();
			trainParams.cycles = cycleCounter_c;
			trainParams.exersices = exercisesCounter_c;
			trainParams.currentTime = ( status_c == WORK ) ? workTime_c : restTime_c;
			trainParams.currentStatus = status_c;
			
			dispatchEvent(new TrainingEvent(TrainingEvent.UPDATE, trainParams));
			
		}
		
		
		public function dispose():void
		{
			timer_c.stop();
			timer_c.removeEventListener(TimerEvent.TIMER, onTickTimer);
			timer_c = null;
		}

	}
}