Feature: NFR001 - Rendimiento y optimización del tiempo de carga
  MentorIA debe garantizar tiempos de respuesta óptimos y carga eficiente en distintos escenarios,
  incluyendo múltiples módulos activos, alta concurrencia y dispositivos de gama media.

  Scenario: Carga inicial de la plataforma en menos de 3 segundos
    Given que el estudiante accede a MentorIA desde un navegador común
    When abre la página principal del sistema
    Then el tiempo total de carga (TTFB + FCP + TTI) no debe superar los 3 segundos
    And los elementos principales deben visualizarse sin saltos o retrasos.

  Scenario Outline: Prueba de carga bajo distintos dispositivos y tipos de conexión
    Given que un estudiante usa un dispositivo "<dispositivo>" con una conexión "<conexion>"
    When accede a la plataforma MentorIA
    Then el tiempo de carga no debe superar "<tiempo_limite>" segundos
    And el rendimiento visual debe mantenerse estable sin retrasos perceptibles.

    Examples:
      | dispositivo     | conexion     | tiempo_limite |
      | "Laptop i3"     | "WiFi 20mb"  | 3              |
      | "Celular Android 4G" | "4G"    | 3              |
      | "Tablet"        | "WiFi"       | 3              |
      | "Laptop i5"     | "Datos 3G"   | 4              |

  Scenario: Manejo eficiente de concurrencia
    Given que 200 usuarios acceden simultáneamente al módulo de "Resultados Vocacionales"
    When el sistema procesa múltiples solicitudes en paralelo
    Then la plataforma no debe presentar caídas
    And los tiempos de respuesta no deben incrementarse más del 20%