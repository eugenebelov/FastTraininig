package controller
{
	import flash.events.Event;
	import model.TrainDTO;
	
	public class TrainingEvent extends Event
	{
		public static const UPDATE:String = "update";
		public var dto:TrainDTO = new TrainDTO();
		
		public function TrainingEvent(type:String, 
									  	training:TrainDTO, 
											bubbles:Boolean = false, 
												cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			
			this.dto = training;
		}
		
		override public function clone():Event
		{
			return new TrainingEvent(type, this.dto, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return formatToString("TrainingEvent", "type", "trainingDataObject", "bubbles", "cancelable", "eventPhase");
		}
	}
}