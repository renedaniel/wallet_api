# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rols = Rol.create(
  [
    {
      name: "Customer",
      rol: "c",
    },
    {
      name: "Admin",
      rol: "a",
    },
  ]
)

transaction_types = TransactionType.create(
  [
    {
      name: "Deposito a cuenta",
      transaction_type: "d",
    },
    {
      name: "Retiro",
      transaction_type: "r",
    },
    {
      name: "Transferencia a otra cuenta",
      transaction_type: "t",
    },
  ]
)

translations = Translation.create([
  {
    key: 'first_name_blank_validation',
    translation: 'Debes ingresar tu nombre',
  },
  {
    key: 'password_blank_validation',
    translation: 'Debe ingresar tu contraseña',
  },
  {
    key: 'home_singup_button',
    translation: '¡Registrate ya!',
  },
  {
    key: 'login_header_label',
    translation: '¡Inicia tu sesión!',
  },
  {
    key: 'ph_form_email',
    translation: 'Aquí tu email',
  },
  {
    key: 'ph_form_password',
    translation: 'Aquí tu contraseña',
  },
  {
    key: 'register_header_label',
    translation: '¡Registrate!',
  },
  {
    key: 'label_form_first_name',
    translation: 'Ingresa tu nombre',
  },
  {
    key: 'label_form_last_name',
    translation: 'Ingresa tus apellidos',
  },
  {
    key: 'label_form_password_confirmation',
    translation: 'Confirma tu contraseña',
  },
  {
    key: 'label_form_email',
    translation: 'Ingresa tu email',
  },
  {
    key: 'label_form_password',
    translation: 'Ingresa tu contraseña',
  },
  {
    key: 'ph_form_first_name',
    translation: 'Aquí tu nombre',
  },
  {
    key: 'ph_form_last_name',
    translation: 'Aquí tus apellidos',
  },
  {
    key: 'ph_form_password_confirmation',
    translation: 'Aquí confirma tu contraseña',
  },
  {
    key: 'ph_form_email',
    translation: 'Aquí ingresa tu email',
  },
  {
    key: 'ph_form_password',
    translation: 'Aquí tu contraseña',
  },

  {
    key: 'email_blank_validation',
    translation: 'Debes ingresar un email',
  },
  {
    key: 'last_name_blank_validation',
    translation: 'Debes ingresar tus apellidos',
  },
  {
    key: 'password_confirmation_blank_validation',
    translation: 'Debes confirmar tu contraseña',
  },
  {
    key: 'email_incorrect_validation',
    translation: 'Debes ingresar un email válido',
  },
  {
    key: 'password_confirmation_confirmation_validation',
    translation: 'Tus contraseñas no coinciden',
  },
  {
    key: 'email_taken_validation',
    translation: 'Este email ya se encuentra registrado',
  },
  {
    key: 'label_form_card_number',
    translation: 'Ingresa el número de tu tarjeta',
  },
  {
    key: 'label_form_full_name',
    translation: 'Ingresa el nombre del titular',
  },
  {
    key: 'label_form_expiration',
    translation: 'Ingresa la fecha de expiración',
  },
  {
    key: 'label_form_cvc',
    translation: 'Ingresa el CVC',
  },
  {
    key: 'ph_form_card_number',
    translation: 'Aquí el número de tu tarjeta',
  },
  {
    key: 'ph_form_full_name',
    translation: 'Aquí el nombre del titular',
  },
  {
    key: 'ph_form_expiration',
    translation: 'Aquí la fecha de expiración',
  },
  {
    key: 'ph_form_cvc',
    translation: 'Aquí el CVC',
  },
  {
    key: 'card_number_blank_validation',
    translation: 'Debes ingresar el número de tarjeta',
  },
  {
    key: 'full_name_blank_validation',
    translation: 'Debes ingresar el nombre del titular',
  },
  {
    key: 'expiration_blank_validation',
    translation: 'Debes ingresar la fecha de expiración',
  },
  {
    key: 'cvc_blank_validation',
    translation: 'Debes ingresar el CVC',
  },
  {
    key: 'cvc_wrong_length_validation',
    translation: 'El CVC debe ser de 3 digitos',
  },
  {
    key: 'card_number_wrong_length_validation',
    translation: 'Tu tarjeta debe tener 16 digitos',
  },
  {
    key: 'card_number_not_a_number_validation',
    translation: 'Tu tarjeta sólo puede contener números',
  },
  {
    key: 'expiration_wrong_length_validation',
    translation: 'La fecha de expiración debe ser de 4 digitos',
  },
  {
    key: 'expiration_metadata',
    translation: '{"months":["01","02","03","04","05","06","07","08","09","10","11","12"],"years":["17","18","19","20","21"]}',
  },
  {
    key: 'label_form_amount',
    translation: '¿Cuánto vas a recargar?',
  },
  {
    key: 'label_form_bank_account',
    translation: 'Ingresa la cuenta CLABE',
  },
  {
    key: 'ph_form_bank_account',
    translation: 'Aquí la cuenta CLABE',
  },
  {
    key: 'label_form_account_number',
    translation: 'Ingresa la cuenta a depositar',
  },
  {
    key: 'ph_form_account_number',
    translation: 'Aquí la cuenta a depositar',
  },
  {
    key: 'ph_form_amount',
    translation: 'Aquí la cantidad',
  },
  {
    key: 'amount_not_a_number_validation',
    translation: 'Debes ingresar una cantidad válida',
  },
  {
    key: 'bank_account_wrong_length_validation',
    translation: 'La cuenta CLABE debe contener 18 digitos',
  },
  {
    key: 'amount_balance_not_enough_validation',
    translation: 'No cuentas con fondos suficientes',
  },
  {
    key: 'account_number_account_not_found_validation',
    translation: 'La cuenta que ingresaste no existe',
  },
  {
    key: 'account_number_not_own_account_error_validation',
    translation: 'No puedes transferir a tu propia cuenta',
  },
])
