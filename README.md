Detalles:

- No se ocupan librerias de terceros para no agregar complejidad al ejecutar proyecto y por el tamaño del proyecto no se hace necesario. 
- Se usa storyboards por simpleza del proyecto, pero para un proyecto mas grande usaria XIB (para hacer mas facil el manejo de cambios en git y ser mas facil hacer componentes) o SwiftUI (por ser mas nuevo y tener ventajas de codigo reactivo y funcional)
- Para la navegacion se usó segues y lo nativo de storyboards pero hubiese preferido hacer composicion y manejar la navegacion como algo separado 
- No hay tests por tiempo
- Para persistencia se usa userDefaults, pero para proyectos mas grandes usaria realm o coreData
- No hay manejo de errores visuales por tiempo, solo a nivel de codigo para que no se caiga
- En la parte de red se usa async await para evitar usar closures que agregan lineas de codigo extra y se hacen las llamadas en un hilo secundario
- intenté separar lo más posible la logica de negocio con el codigo de las vistas para no hacer un massive view controller, idealmente usar algun patron como MVVM.
