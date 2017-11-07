package
{
	import net.wg.infrastructure.base.AbstractWindowView;
    public class TestWindow extends AbstractWindowView
    {
		public var py_getCustomConfig:Function;
        public function TestWindow()
        {
            super();
        }

        override protected function onPopulate() : void
        {
            super.onPopulate();
            var _config:Object=py_getCustomConfig();
		        width=_config.width;
		        height=_config.height;
		        window.title=_config.title;
        }
    }
}
