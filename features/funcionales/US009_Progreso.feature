Feature: US009 - Seguimiento de progreso vocacional

    Scenario: Visualización de línea de tiempo
    Dado que el estudiante ha iniciado sesión y tiene actividades registradas,
    Cuando navega al menú principal y hace clic en la sección "Mi Progreso",
    Entonces el sistema muestra una "Línea de Tiempo" ordenada cronológicamente,
    Y en la línea de tiempo se visualizan los hitos completados "hito_completado",
    Y se muestra el estado actual de las actividades en curso "actividad_en_curso".

    Examples:
    | estudiante | hito_completado           | fecha_hito   | actividad_en_curso      |
    | "Fernando" | "Perfil completado (100%)"| "10/03/2024" | "Test Vocacional (50%)" |
    | "Alex"     | "Test Vocacional Final"   | "12/03/2024" | "Cita agendada: Mentor" |
    | "Joaquin"  | "Sesión Mentoría #1"      | "15/03/2024" | "Revisión de resultados"|

    Scenario : Alertas de hitos pendientes
    Dado que el estudiante tiene tareas, tests o citas pendientes de completar,
    Cuando accede a la sección "Mi Progreso",
    Entonces el sistema resalta visualmente los ítems pendientes en la "Línea de Tiempo",
    Y muestra un contador visible indicando la cantidad de tareas pendientes "cantidad".

    Examples:
    | items_pendientes              | cantidad | color_alerta |
    | "Completar Test de Intereses" | "1"      | "Naranja"    |
    | "Agendar cita, Subir Perfil"  | "2"      | "Rojo"       |

    Scenario: Datos incompletos o desactualizados (Error de sincronización)
    Dado que existe una falla de sincronización entre la base de datos de actividades y el módulo de Progreso,
    Cuando el estudiante visualiza la sección "Mi Progreso",
    Entonces el sistema detecta la inconsistencia de datos,
    Y muestra un mensaje de error: "Error al cargar datos. La información podría estar incompleta.",
    Y muestra un botón "Sincronizar Ahora" para intentar refrescar la información.
