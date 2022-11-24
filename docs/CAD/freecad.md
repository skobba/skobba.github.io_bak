# Freecad

## Workbench Development
Python documentation on localhost
* [http://localhost:7465](http://localhost:7465)

Freecad folder
```
/Users/USERNAME/Library/Preferences/FreeCAD/Mod/CurvedShapes
```


Reload module
```
from importlib import reload
import CurvedArray
reload(CurvedArray)
```

## Linkstage3
```
./FreeCAD-asm3-Daily-Conda-Py3.10-20221112-glibc2.12-x86_64.AppImage --system-cfg $PWD/link.system.cfg --user-cfg $PWD/link.user.cfg
```
