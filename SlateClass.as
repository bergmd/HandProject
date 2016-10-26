/*
* VERSION 2.0 - Replace the FileNewProperty to AssetUploadPropertyInfo.
*/

package
{
	import com.innovid.creative.CreativeSize;
	import com.innovid.creative.ICreativeRuntime;
	import com.innovid.creative.ICreativeUnit;
	import com.innovid.editor.FileNewPropertyInfo;
	import com.innovid.editor.ListPropertyInfo;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.DisplayObject;
	import flash.utils.getDefinitionByName;
	import com.innovid.editor.AssetUploadPropertyInfo;
	/**
	 * ...
	 * @author Avichay Eyal
	 */
	public class SlateClass extends MovieClip implements ICreativeUnit 
	{
		private const CLICKTHROUGH:Number = 1;
		private const CUSTOM_CLICKTHROUGH:Number = 2;
		private const IN_UNIT_CLICK:Number = 0;
		
		public function get supportedProperties ():Array {
			
			//var assetProp = new AssetUploadPropertyInfo('XML Path', 'data.xml');
			var classic = Innovid.generateStudioProperties ([
				//['JSON Images Path', ''],
				//['Relative Path', ''], //http://files.innovid.com/creative/external/wideout/ || ../../assets/_images/
				//['Showing Date', '01/23/2012'],
	
		   ]);
		   return combineProperties([ScaleManager.listOfPlayers, classic, videoProperties()]);
		  // return combineProperties([ assetProp, classic, videoProperties(), dealerLocatorProperties() , studioDropdown(), ticketsAndShowtimes() ]);

		}
		include "com/include/videoProperties.as"
		//include "com/include/dealerLocatorProperties.as"
		//include "com/include/ticketsAndShowtimes.as"
		//include "com/include/studioDropdown.as"
		public function get supportedSizes ():Array{
			
			//////// just comment out the present sizes //////////////////////
			
			/*return [
				new CreativeSize(1, 1, 'Small')
				];*/
			return [
				new CreativeSize(1, 1, 'Large')
				];
			/*return [
				new CreativeSize(1, 1, 'Huge')
				];*/
			/*return [
				new CreativeSize(1, 1, 'Small'),
				new CreativeSize(400, 250, 'Large')
				];*/
			/*return [
				new CreativeSize(1, 1, 'Small'),
				new CreativeSize(400, 250, 'Huge')
				];*/
			/*return [
				new CreativeSize(1, 1, 'Large'),
				new CreativeSize(732, 411, 'Huge')
				];*/
			/*return [
				new CreativeSize(1, 1, 'Small'),
				new CreativeSize(400, 250, 'Large'),
				new CreativeSize(732, 411, 'Huge')
				];*/
		}
		public function SlateClass(){
			super();
			try{
				if (stage){
					stage.scaleMode = StageScaleMode.NO_SCALE;
					stage.align = StageAlign.TOP_LEFT;
				}
			}
			catch (e:Error){trace('No Access to stage');}
		}
		public function get supportedLabels ():Array{
			 include "com/include/labels_slate.as"
		}
		public function createInstance(classAlias:String):ICreativeRuntime {
			var slateType =  getDefinitionByName("MC_Slate_"+classAlias);
			var instance:* = new slateType();
			return instance;
		}
		
		private function combineProperties(arr:Array):Array{
			var combArr:Array = new Array();
			for (var i:uint = 0 ; i< arr.length ; i++){
				combArr = combArr.concat(arr[i]);
			}
			return combArr;
		}
	}
}