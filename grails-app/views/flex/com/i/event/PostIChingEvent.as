package com.i.event
{
	import flash.events.Event;

	public class PostIChingEvent extends Event
	{
		public static const GET_ALL:String 	= "getAllPostIChingsEvent";		
		public static const SELECT:String  	= "selectPostIChingEvent";
		
		public function PostIChingEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}