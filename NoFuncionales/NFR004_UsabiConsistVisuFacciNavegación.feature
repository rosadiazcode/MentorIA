Feature: NFR004 - Usabilidad, consistencia y reducción de carga cognitiva
  El sistema debe ser intuitivo, consistente y permitir que los usuarios completen tareas
  con mínima complejidad.

  Scenario: Navegación con máximo 3 clics hacia secciones principales
    Given que el estudiante está en la pantalla principal
    When desea acceder a cualquier sección clave como "Mi Perfil", "Resultados", "Agenda" o "Exploración"
    Then debe poder llegar en 3 clics o menos.

  Scenario Outline: Consistencia visual en pantallas
    Given que el usuario navega en la sección "<seccion>"
    When interactúa con botones, formularios y menús
    Then los elementos deben conservar el mismo estilo, color, tamaño y posición.

    Examples:
      | seccion         |
      | "Mi Perfil"     |
      | "Resultados"    |
      | "Agenda"        |
      | "Exploración"   |

  Scenario: Retroalimentación inmediata
    Given que el usuario realiza una acción como guardar, editar o eliminar
    When el sistema procesa la acción
    Then debe mostrar un mensaje de retroalimentación en menos de 1 segundo.