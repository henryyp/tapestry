package uk.co.tapestry.view.components {
	
	import com.greensock.easing.Elastic;
	import uk.co.tapestry.events.StateChangeEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.*;

	import com.greensock.TweenMax;
	import uk.co.tapestry.view.components.AbstractComponent;
	import uk.co.tapestry.view.IComponent;
	
	import uk.co.tapestry.view.components.MainNavButtons;
	import uk.co.tapestry.events.MainNaviEvent;
	

	/**
	 * @author henryyp
	 */
	public class Finder extends AbstractComponent implements IComponent {
		
		// VARIABLES -------------------------------- //
		
		private var bg:Sprite;
		private var _data:Array;

		
		// CONSTRUCTOR ------------------------------ //		
		public function Finder(sS:Sprite, iData:Array) {
			
			super(sS);
			_data = iData;
			Init();
		}

		
		// FUNCTION ------------------------------ //		
		override public function Init():void {
			
			super.Init();
			_container 		= new AssetFinder();
			bg	 			= _container.getChildByName('bg') as Sprite;
			//TODO: when animated in
			_mainContainer.addChild(_container);
			
			//bg.alpha 				= 0.7;
			_container.alpha = 0;
			TweenMax.fromTo(_container, 0.5, {x: _container.x+30, alpha:0, ease: Elastic.easeInOut}, {x: _container.x, alpha:1, onComplete:onAnimationInComplete});
		}
		
		override public function Kill(isSlow:Boolean = false):void {
			trace('News Component Killed');
			_mainContainer.removeChild(_container);
			_container = null;
			onAnimationOutComplete();
		}
					
		
	}
	
}
		
		