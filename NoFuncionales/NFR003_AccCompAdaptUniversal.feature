Feature: NFR003 - Accesibilidad total y diseño adaptativo compatible con WCAG 2.1 AA
  La plataforma debe garantizar que cualquier usuario pueda acceder a la información de forma clara,
  legible y sin barreras visuales ni de interacción.

  Scenario: Adaptación automática en dispositivos móviles
    Given que el estudiante accede desde un dispositivo móvil
    When se carga la interfaz
    Then el diseño debe adaptarse automáticamente al tamaño disponible
    And no debe existir desplazamiento horizontal
    And los botones deben tener un área táctil mínima de 44x44px.

  Scenario Outline: Validación de accesibilidad para distintos tipos de usuario
    Given que el usuario "<tipo_usuario>" accede a la plataforma
    When navega por las secciones principales
    Then el sistema debe permitir uso de teclado, lector de pantalla y contraste adecuado.

    Examples:
      | tipo_usuario     |
      | "Usuario con baja visión" |
      | "Usuario con lector de pantalla" |
      | "Usuario en modo oscuro" |

  Scenario: Verificación de contraste visual
    Given que la interfaz muestra texto sobre fondo
    When se analiza el contraste de colores
    Then debe cumplir un ratio mínimo AA (4.5:1)
    And los textos principales deben ser completamente legibles.

  Scenario: Compatibilidad con navegación por teclado
    Given que un usuario no usa mouse
    When navega con tecla Tab
    Then todos los elementos interactivos deben ser alcanzables
    And debe existir un indicador visual de foco.