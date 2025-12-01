Feature: NFR002 - Seguridad avanzada, cifrado y protección de datos
  Toda información personal y vocacional debe estar protegida mediante cifrado robusto,
  validaciones de integridad, políticas de bloqueo y estándares OWASP.

  Scenario: Conexión cifrada mediante HTTPS
    Given que el estudiante accede a MentorIA
    When revisa la barra de direcciones del navegador
    Then se debe mostrar el ícono de candado
    And la conexión debe operar bajo protocolo HTTPS con TLS 1.2 o superior.

  Scenario Outline: Almacenamiento seguro de datos sensibles
    Given que el usuario ingresa el dato "<dato>"
    When el sistema lo guarda en la base de datos
    Then los datos deben cifrarse usando AES-256
    And las contraseñas deben ser hasheadas con salt y un algoritmo como bcrypt.

    Examples:
      | dato           |
      | "Contraseña"   |
      | "DNI"          |
      | "Teléfono"     |
      | "Resultados de Test" |

  Scenario: Protección contra fuerza bruta
    Given que el usuario intenta iniciar sesión incorrectamente más de 5 veces
    When se excede el límite establecido
    Then el sistema bloquea temporalmente la cuenta
    And registra el intento en logs de seguridad.

  Scenario: Protección contra ataques XSS
    Given que un campo acepta entrada de texto
    When el usuario intenta ingresar código malicioso "<script>"
    Then el sistema debe sanitizar la entrada
    And bloquear la ejecución del script.

    Examples:
      | script                  |
      | "<script>alert(1)</script>" |
      | "<img src=x onerror=alert(1)>" |