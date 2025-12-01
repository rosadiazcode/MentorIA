Feature: US007 - Agenda de citas con mentores y psicólogos

    Scenario Outline: Agendar sesión exitosamente
    Dado que el estudiante ha iniciado sesión,
    Cuando accede a la sección "Agenda de Mentorías",
    Y el sistema muestra el calendario con la disponibilidad de mentores,
    Y el estudiante selecciona una fecha "fecha", hora "hora" y un mentor disponible "mentor",
    Y hace clic en el botón "Confirmar Cita",
    Entonces el sistema reserva el horario en la agenda,
    Y el sistema envía una confirmación por correo electrónico al estudiante y al mentor,
    Y la cita se añade al historial de sesiones del estudiante.

    Examples:
    | mentor            | fecha        | hora       | especialidad |
    | "Dra. Ana López"  | "15/10/2025" | "10:00 AM" | "Psicología" |
    | "Ing. Roberto G." | "16/10/2025" | "14:00 PM" | "Ingeniería" |
    | "Lic. Marta Diaz" | "18/10/2025" | "09:30 AM" | "Vocacional" |

    Scenario Outline: Reprogramación de cita
    Dado que el estudiante tiene una cita programada y confirmada con "mentor",
    Cuando navega a la sección "Mis Citas" y selecciona la opción "Reprogramar",
    Y elige una nueva fecha "nueva_fecha" y hora "nueva_hora" que está disponible en la agenda del mentor,
    Y hace clic en el botón "Actualizar Cita",
    Entonces el sistema libera el horario anterior y actualiza la reserva con la nueva hora,
    Y el sistema envía una notificación (correo o alerta) al mentor y al estudiante informando de la reprogramación.

    Examples:
    | mentor            | fecha_original | nueva_fecha  | nueva_hora |
    | "Dra. Ana López"  | "15/10/2025"   | "20/10/2025" | "11:00 AM" |
    | "Ing. Roberto G." | "16/10/2025"   | "17/10/2025" | "16:00 PM" |

    Scenario: Horario no disponible
    Dado que el estudiante está revisando la agenda de citas,
    Y selecciona un horario que ya está ocupado o fuera del horario de atención del mentor,
    Cuando intenta seleccionar o confirmar ese horario,
    Entonces el sistema bloquea la selección de ese slot,
    Y muestra un mensaje de alerta: "Horario no disponible. Por favor, seleccione otro."