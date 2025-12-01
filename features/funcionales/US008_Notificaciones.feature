Feature: US008 - Confirmación y notificaciones de sesiones

    Scenario: Notificación de recordatorio antes de sesión
    Dado que el estudiante tiene una sesión de mentoría programada con "mentor",
    Y faltan exactamente 24 horas para la hora de inicio de la cita,
    Cuando el sistema ejecuta el proceso de envío de recordatorios,
    Entonces el sistema envía una notificación de recordatorio (correo electrónico o alerta push),
    Y la notificación incluye la fecha, hora "hora_cita" y nombre del mentor "mentor".

    Examples:
    | mentor             | fecha_cita   | hora_cita  | tipo_notificacion |
    | "Dra. Ana López"   | "20/10/2025" | "10:00 AM" | "Email"           |
    | "Ing. Roberto G."  | "21/10/2025" | "16:00 PM" | "Push App"        |

    Scenario: Confirmación de asistencia
    Dado que el estudiante ha recibido la notificación de recordatorio hace 24 horas,
    Y la notificación incluye un botón de acción "Confirmar Asistencia",
    Cuando el estudiante hace clic en el botón "Confirmar Asistencia",
    Entonces el sistema actualiza el estado de la sesión a "Asistencia Confirmada",
    Y muestra un mensaje de éxito: "Tu asistencia ha sido registrada."

    Scenario: No respuesta a confirmación (Alerta final)
    Dado que la sesión de mentoría tiene el estado "Asistencia Pendiente de Confirmación",
    Y faltan exactamente 6 horas para la hora de inicio de la cita "hora_cita",
    Cuando el sistema detecta que el estudiante no ha respondido a la notificación de 24 horas,
    Entonces el sistema envía una notificación de alerta final al estudiante: "Por favor, confirme su asistencia o su cita podría ser cancelada.",
    Y el sistema notifica al mentor "mentor" sobre la falta de respuesta del estudiante.

    Examples:
    | mentor            | hora_cita  | hora_alerta_final |
    | "Lic. Marta Diaz" | "16:00 PM" | "10:00 AM"        |
    | "Psic. Juan P."   | "14:00 PM" | "08:00 AM"        |
