package
{
	App.instance.loaderMgr.loadLibraries(Vector.<String>([
		"guiControlsLobbyBattle.swf"
	]));
	App.utils.classFactory.getComponent("DropdownMenuUI", DropdownMenu);
	import net.wg.gui.components.controls.DropdownMenu;
    import net.wg.infrastructure.base.AbstractWindowView;
    import net.wg.gui.components.controls.SoundButton;
    import flash.text.*;
	import scaleform.clik.data.DataProvider;
	import scaleform.clik.events.*;
	import flash.events.Event;
	import flash.events.MouseEvent;

    public class Main extends AbstractWindowView
    {
        private var soundButtonLoad		: SoundButton;
        private var soundButtonCancel	: SoundButton;
        private var textFieldTest		: TextField;
		private var ddMenu				: DropdownMenu;
		public var mapName : int;
		//public var clickedLoad:Function = null;
		

        public function Main()
        {
            super();
        }

        override protected function onPopulate() : void
        {
            super.onPopulate();
            width = 600;
            height = 400;
            window.title = "Test Window";
			var data : Array = new Array();
			data.push( { "label":"00_tank_tutorial" } );
			data.push( { "label":"01_karelia" } );
			data.push( { "label":"02_malinovka" } );
			data.push( { "label":"04_himmelsdorf" } );
			data.push( { "label":"05_prohorovka" } );
			data.push( { "label":"06_ensk" } );
			data.push( { "label":"07_lakeville" } );
			data.push( { "label":"08_ruinberg" } );
			data.push( { "label":"10_hills" } );
			data.push( { "label":"11_murovanka" } );
			data.push( { "label":"13_erlenberg" } );
			data.push( { "label":"14_siegfried_line" } );
			data.push( { "label":"17_munchen" } );
			data.push( { "label":"18_cliff" } );
			data.push( { "label":"19_monastery" } );
			data.push( { "label":"22_slough" } );
			data.push( { "label":"23_westfield" } );
			data.push( { "label":"28_desert" } );
			data.push( { "label":"29_el_hallouf" } );
			data.push( { "label":"31_airfield" } );
			data.push( { "label":"33_fjord" } );
			data.push( { "label":"34_redshire" } );
			data.push( { "label":"35_steppes" } );
			data.push( { "label":"36_fishing_bay" } );
			data.push( { "label":"37_caucasus" } );
			data.push( { "label":"38_mannerheim_line" } );
			data.push( { "label":"44_north_america" } );
			data.push( { "label":"45_north_america" } );
			data.push( { "label":"47_canada_a" } );
			data.push( { "label":"63_tundra" } );
			data.push( { "label":"73_asia_korea" } );
			data.push( { "label":"83_kharkiv" } );
			data.push( { "label":"84_winter" } );
			data.push( { "label":"86_himmelsdorf" } );
			data.push( { "label":"92_starlingrad" } );
			data.push( { "label":"95_lost_city" } );
			data.push( { "label":"96_prohorovka_defence" } );
			data.push( { "label":"100_thepit" } );
			data.push( { "label":"101_dday" } );
			data.push( { "label":"103_ruinberg_winter" } );
			data.push( { "label":"112_eiffel_tower_ctf" } );
			data.push( { "label":"114_czech"} );
			data.push( { "label":"120_kharkiv_halloween" } );
			data.push( { "label":"212_epic_random_valley" } );
			data.push( { "label":"h03_shopfest_2015" } );
			data.push( { "label":"hangar_bootcamp" } );
			data.push( { "label":"hangar_halloween_v2" } );
			data.push( { "label":"hangar_kharkiv_halloween" } );
			data.push( { "label":"hangar_premium_v2" } );
			data.push({"label":"hangar_v2"});
			var dataProv : DataProvider = new DataProvider(data);
			textFieldTest = new TextField();
            textFieldTest.width = 590;
            textFieldTest.height = 360;
            textFieldTest.x = 20;
            textFieldTest.y = 15;
            textFieldTest.multiline = true;
            textFieldTest.selectable = false;
            textFieldTest.defaultTextFormat = new TextFormat("$FieldFont", 20, 0xEA4517);
			textFieldTest.text = "If You Select Map Name and Push 'Load' Button, it will load Map.";
			addChild(textFieldTest);
			ddMenu = addChild(App.utils.classFactory.getComponent("DropdownMenuUI", DropdownMenu, {
				x: 20,
				y: 40,
				width: 200,
				itemRenderer: "DropDownListItemRendererSound",
				dropdown: "DropdownMenu_ScrollingList",
				menuRowCount: dataProv.length,
				//rowCount:rows,
				//scrollBar:scrBar,
				dataProvider: dataProv,
				selectedIndex: 0
			})) as DropdownMenu;
			//this.ddMenu.addEventListener(ListEvent.INDEX_CHANGE, this.ddMenuChange, false, 0, true);
            soundButtonLoad = addChild(App.utils.classFactory.getComponent("ButtonRed", SoundButton, {
                width: 100,
                height: 25,
                x: 195,
                y: 365,
                label: "Load"
            })) as SoundButton;
			this.soundButtonLoad.addEventListener(MouseEvent.CLICK,this._LoadClick);
            soundButtonCancel = addChild(App.utils.classFactory.getComponent("ButtonNormal", SoundButton, {
                width: 100,
                height: 25,
                x: 305,
                y: 365,
                label: "Cancel"
            })) as SoundButton;
			this.soundButtonCancel.addEventListener(MouseEvent.CLICK,this._CancelClick);
        }
		function _LoadClick():void
		{
			var _loc3_:int = this.ddMenu.selectedIndex;
			_loc3_ = mapName;
			this.onWindowClose();
		}
		function _CancelClick():void 
		{
			this.onWindowClose();
		}
    }
}
