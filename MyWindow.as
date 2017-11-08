package 
{
    import net.wg.gui.components.controls.*;
    import net.wg.infrastructure.base.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;

    public class MyWindow extends AbstractWindowView
    {
        public var callFromFlash:Function = null;
        public var submitBtn:SoundButtonEx;
        public var cancelBtn:SoundButtonEx;
        public var ddMenu:DropdownMenu;
        public var cbUse:CheckBox;
        public var tfLabel:TextFieldShort;
        public var copyLabel:TextFieldShort;

        public function MyWindow()
        {
            this.canClose = true;
            this.isCentered = true;
            return;
        }// end function

        override protected function configUI() : void
        {
            this.window.title = "Настройки ангара";
            this.window.setTitleIcon("team");
            this.submitBtn.label = "#settings:apply_button";
            this.cancelBtn.label = "#settings:cancel_button";
            this.submitBtn.width = this.cancelBtn.width = 90;
            this.submitBtn.addEventListener(ButtonEvent.CLICK, this.handleSubmitBtnClick);
            this.cancelBtn.addEventListener(ButtonEvent.CLICK, this.handleCancelBtnClick);
            this.cbUse.setSize(250, 20);
            this.cbUse.label = "Использовать случайный камуфляж";
            this.tfLabel.label = "Камуфляж:";
            this.tfLabel.y = this.tfLabel.y + 2;
            this.tfLabel.showToolTip = false;
            this.tfLabel.selectable = false;
            this.tfLabel.textSize = this.cbUse.textSize;
            this.tfLabel.textColor = this.cbUse.textColor;
            this.tfLabel.textFont = this.cbUse.textFont;
            this.ddMenu.rowCount = 3;
            this.ddMenu.menuDirection = "down";
            this.ddMenu.itemRenderer = "DropDownListItemRendererSound";
            this.ddMenu.dropdown = "DropdownMenu_ScrollingList";
            this.copyLabel.label = "© S0me0ne";
            this.copyLabel.showToolTip = false;
            this.copyLabel.selectable = false;
            this.copyLabel.textSize = this.cbUse.textSize;
            this.copyLabel.textColor = this.cbUse.textColor;
            this.copyLabel.textFont = this.cbUse.textFont;
            return;
        }// end function

        override protected function onPopulate() : void {
         super.onPopulate();
         this.setSize(300,110);
         this.window.useBottomBtns = true;
         var _loc1_:Array = new Array();
         _loc1_.push(
            {
               "label":"#tooltips:customization/camouflage/winter",
               "data":"winter"
            });
         _loc1_.push(
            {
               "label":"#tooltips:customization/camouflage/summer",
               "data":"summer"
            });
         _loc1_.push(
            {
               "label":"#tooltips:customization/camouflage/desert",
               "data":"desert"
            });
         this.ddMenu.dataProvider = new DataProvider(_loc1_);
      }

        public function handleSubmitBtnClick(event:ButtonEvent) : void
        {
            var _loc_2:* = this.ddMenu.dataProvider[this.ddMenu.selectedIndex];
            this.callFromFlash({camo:_loc_2.data, random:this.cbUse.selected});
            return;
        }// end function

        public function handleCancelBtnClick(event:ButtonEvent) : void
        {
            this.onWindowClose();
            return;
        }// end function

        private function getIndexByData(param1:String) : int
        {
            var _loc_2:* = undefined;
            for (_loc_2 in this.ddMenu.dataProvider)
            {
                
                if (this.ddMenu.dataProvider[_loc_2].data == param1)
                {
                    return _loc_2;
                }
            }
            return -1;
        }// end function

        public function as_callToFlash(param1:Array) : void
        {
            this.ddMenu.selectedIndex = this.getIndexByData(param1.camo);
            this.cbUse.selected = param1.random;
            return;
        }// end function

    }
}
