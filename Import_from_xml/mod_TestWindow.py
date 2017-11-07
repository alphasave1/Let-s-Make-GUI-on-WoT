from gui.Scaleform.framework import g_entitiesFactories, ViewSettings
from gui.Scaleform.framework import ViewTypes, ScopeTemplates
from gui.Scaleform.framework.entities.abstract.AbstractWindowView import AbstractWindowView
from gui.app_loader import g_appLoader
from gui.Scaleform.framework.managers.loaders import ViewLoadParams
from gui.shared.utils.key_mapping import getBigworldNameFromKey
import ResMgr
class TestWindow(AbstractWindowView):

    def __init__(self):
        super(TestWindow, self).__init__()
        self.__config_section=ResMgr.openSection('../configs/config.xml')

    def py_getCustomConfig(self):
        return {
            'title':self.__config_section.readString('title'),
            'width':self.__config_section.readString('width'),
            'height':self.__config_section.readString('height')

    def _populate(self):
        super(TestWindow, self)._populate()

    def onWindowClose(self):
        self.destroy()


_alias = 'TestWindow'
_url = 'TestWindow.swf'
_type = ViewTypes.WINDOW
_event = None
_scope = ScopeTemplates.VIEW_SCOPE


_settings = ViewSettings(_alias, TestWindow, _url, _type, _event, _scope)
g_entitiesFactories.addSettings(_settings)

def onhandleKeyEvent(event):
    key = getBigworldNameFromKey(event.key)
    if key == 'KEY_F10':
        g_appLoader.getDefLobbyApp().loadView(ViewLoadParams(_alias, None))
    return None

from gui import InputHandler
InputHandler.g_instance.onKeyDown += onhandleKeyEvent
